#キーの配列
key_number = [
  "Cb",
  "C",
  "C#",
  "Db",
  "D",
  "Eb",
  "E",
  "F",
  "F#",
  "Gb",
  "G",
  "Ab",
  "A",
  "Bb",
  "B",
  "Cm",
  "C#m",
  "Dm",
  "D#m",
  "Ebm",
  "Em",
  "Fm",
  "F#m",
  "Gm",
  "G#m",
  "Abm",
  "Am",
  "A#m",
  "Bbm",
  "Bm"
]
#スケール配列
scale = [
  #major
  ["Cb","Db","Eb","E","Gb","Ab","Bb"],
  ["C","D","E","F","G","A","B"],
  ["C#","D#","F","F#","G#","A#","C"],
  ["Db","Eb","F","Gb","Ab","Bb","C"],
  ["D","E","F#","G","A","B","C#"],
  ["Eb","F","G","Ab","Bb","C","D"],
  ["E","F#","G#","A","B","C#","D#"],
  ["F","G","A","Bb","C","D","E"],
  ["F#","G#","A#","B","C#","D#","F"],
  ["Gb","Ab","Bb","B","Db","Eb","F"],
  ["G","A","B","C","D","E","F#"],
  ["Ab","Bb","C","Db","Eb","F","G"],
  ["A","B","C#","D","E","F#","G#"],
  ["Bb","C","D","Eb","F","G","A"],
  ["B","C#","D#","E","F#","G#","A#"],
  #minor
  ["C","D","Eb","F","G","Ab","Bb"],
  ["C#","D#","E","F#","G#","A","B"],
  ["D","E","F","G","A","Bb","C"],
  ["D#","F","F#","G#","A#","B","C#"],
  ["Eb","F","Gb","Ab","Bb","B","Db"],
  ["E","F#","G","A","B","C","D"],
  ["F","G","Ab","Bb","C","Db","Eb"],
  ["F#","G#","A","B","C#","D","E"],
  ["G","A","Bb","C","D","Eb","F"],
  ["G#","A#","B","C#","D#","E","F#"],
  ["Ab","Bb","B","Db","Eb","E","Gb"],
  ["A","B","C","D","E","F","G"],
  ["A#","C","C#","D#","F","F#","G#"],
  ["Bb","C","Db","Eb","F","Gb","Ab"],
  ["B","C#","D","E","F#","G","A"]
]

#input_キーの配列
input = readlines
len = input.length
i = 0
while i < len
    input[i] = input[i].chomp.split(',')
    i += 1
end

#keyをループにかけて、各キーに合うスケールを抽出し、コード進行をディグリーネームに変える
input.each do |i|
    #キーのインデックスを格納
    key_int = key_number.index(i[0])
    # puts "ky_numberは" , key_number[key_int]
    #コード進行を分解して格納
    cp = i[1]
    #cpが？の場合は？を出力
    if cp == "?"
        puts "?"
    else
        #cpを１つずつに分解
        cp = cp.split('-')
        cp.each do |c|
            #コードが3文字以上(Bbm,B#M7等)の場合は基音のみ(頭2文字だけ)にする
            if c.length > 2 then
                c = c.slice(0..1)
            end
            #　#,bを含まない場合、2文字にしてもm,M,7などが残ってしまうため、末尾を切る(基音のみにする
            if c.include?("#")
                x = "ture"
            else
                x = "false"
            end
            if c.include?("b")
                y = "true"
            else
                y = "false"
            end
            if c.length == 2 && x == "false" && y == "false"
                c.chop!
            end
            #同じコードが見つからない場合、
            # C,Amスケールの場合は#かbが余計にあり、C#,D,E,F#,G,A,B,C#m,D#m,Em,F#m,G#m,A#m,Bmスケールの場合は#が、それ以外のスケールはbがないことによる。
            #それぞれのスケールに応じて#,bを消すか付け加える
            if scale[key_int].include?(c) == false
                if c.include?("#") or c.include?("b")
                    c.chop!
                elsif key_number[key_int] == "C#" ||
                key_number[key_int] == "D" ||
                key_number[key_int] == "E" ||
                key_number[key_int] == "F#" ||
                key_number[key_int] == "G" ||
                key_number[key_int] == "A" ||
                key_number[key_int] == "B" ||
                key_number[key_int] == "C#m" ||
                key_number[key_int] == "D#m" ||
                key_number[key_int] == "Em" ||
                key_number[key_int] == "F#m" ||
                key_number[key_int] == "G#m" ||
                key_number[key_int] == "A#m" ||
                key_number[key_int] == "Bm" then
                    c << "#"
                else
                    c << "b"
                end
            end
            #コードをディグリーネームに変換して出力
            print(scale[key_int].index(c).to_i + 1)
        end
        puts ""
    end
end
