# 必要なlibraryを読み込んでおく
library(spotifyr)
library(httr)
library(purrr)
# SpotifyのAPIを使うための認証情報を設定する
Sys.setenv(SPOTIFY_CLIENT_ID = "<CLIENT_ID>")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "<CLIENT_SECRET>")
# ジャンルを取得
# https://api.spotify.com/v1/recommendations/available-genre-seeds　のエンドポイントを使う。
genres <- httr::RETRY('GET', url = 'https://api.spotify.com/v1/recommendations/available-genre-seeds', query = list(access_token = get_spotify_access_token(), limit=130), quiet = TRUE) %>% content()
#  取得した結果をデータフレームにする
m <- do.call(rbind,lapply(genres$genre, function(x) if(is.null(x)) NA else c(x)))
genres_df <- as.data.frame(m)
#列名をつける
colnames(genres_df) <- c("genre")
# genres_df
# ジャンル毎に1000曲取ってくるにはサーチのAPIを使う。
# https://api.spotify.com/v1/searchというエンドポイントを指定
get_genre_track <- function(genre){
  track_check <- RETRY('GET', url = paste0("https://api.spotify.com/v1/search?query=genre%3A",genre),  query = list(type="track",limit = 50, offset = 0, access_token = get_spotify_access_token()), quiet = TRUE) %>% content()
    #ジャンル毎に1000曲とる
  track_count <- 1000
    # 一回あたりのSpotifyのAPI Callで取得できる上限は50件なので
    # 分割してデータをとる。
  num_loops <- ceiling(track_count / 50)
  numoffset <- 0
    # APIを呼ぶ際に、offsetを使うと欲しいデータを分割して取れるので
    # offsetをずらしながら最後までデータをとる
  track_df <- map_df(1:ceiling(num_loops), function(this_loop) {
    res <- RETRY('GET', url = paste0("https://api.spotify.com/v1/search?query=genre%3A",genre), query = list(type="track",limit = 50, offset = numoffset, access_token = get_spotify_access_token()), quiet = TRUE) %>% content()
    numoffset <<- numoffset + 50
        # 結果をデータフレームにまとめる
    df <- map_df(1:length(res$tracks$items), function(this_row) {
      tryCatch({
        this_track <- res$tracks$items[[this_row]]
        track_uri <- this_track$id
        name <- this_track$name
        genre <- genre
        popularity <- this_track$popularity
        list(track_uri = track_uri, name = name, genre = genre, popularity = popularity)
      }, error = function(e){
        NULL
      })
    })
  })
}
# ジャンルのデータフレームを基にして、曲を一つのデータフレームにまとめる
tracks_df <- lapply(genres_df$genre, get_genre_track) %>% bind_rows()
tracks_df

features_df <- map_df(tracks_df$track_uri, function(x){
    res2 <- spotifyr::get_track_audio_features(x, authorization = get_spotify_access_token())
})
features_df
# # features_df <- tracks_df %>% spotifyr::get_track_audio_features()
# # Genre情報が落ちてしまっているのでtrack_dfから取ってくる
result <- cbind(tracks_df, features_df)
result

