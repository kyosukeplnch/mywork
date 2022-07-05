# coding : utf-8

import pandas as pd
import matplotlib.pyplot as plt

# csvの読み込み
data = pd.read_csv(filepath_or_buffer="heroes_information.csv", encoding="utf-8")

# 読み込んだcsvから性別と出版社を抽出・格納
data_gender = data["Gender"]
data_publisher = data["Publisher"]

# 性別ごとのデータ抽出
data_Gender_Male = data_gender[(data_gender == "Male")]
data_Gender_Female = data_gender[(data_gender == "Female")]
data_Gender_others = data_gender[(data_gender != "Male") & (data_gender != "Female")]

# 出版社ごとのデータ抽出
data_Publisher_Marvel = data_publisher[(data_publisher == "Marvel Comics")]
data_Publisher_DC = data_publisher[(data_publisher == "DC Comics")]
data_Publisher_others = data_publisher[(data_publisher != "Marvel Comics") & (data_publisher != "DC Comics")]

# 性別ごとのデータ数を格納
pieChart_Gender = [
  data_Gender_Male.size,
  data_Gender_Female.size,
  data_Gender_others.size
]
# 出版社ごとのデータ数を格納
barChart_Publisher = [
  data_Publisher_Marvel.size,
  data_Publisher_DC.size,
  data_Publisher_others.size
]

# 各グラフのラベルなどを定義
pieChart_labels = 'Male', 'Female', 'Other'
pieChart_colors = '#1e90ff', '#ffb6c1', '#a9a9a9'
barChart_labels = 'Marvel', 'DC', 'Other'
barChart_colors = '#dc143c', '#00bfff', '#a9a9a9'
barChart_left = 1, 2, 3

# 円グラフ生成
fig1, ax1 = plt.subplots()
ax1.pie(pieChart_Gender, labels=pieChart_labels, colors=pieChart_colors, autopct='%1.1f%%', counterclock=False, startangle=90)

# 棒グラフ生成
fig2, ax2 = plt.subplots()
ax2.bar(barChart_left, barChart_Publisher, tick_label=barChart_labels, align="center", color=barChart_colors)

# 出力
print(
  '734件中`\n'
  '男性:' + str(data_Gender_Male.size) + '体\n'
  '女性:' + str(data_Gender_Female.size) + '体\n'
  'その他:' + str(data_Gender_others.size) + '体\n'
  'マーベルコミックス:' + str(data_Publisher_Marvel.size) + '\n'
  'DCコミックス:' + str(data_Publisher_DC.size) + '\n'
  'その他:' + str(data_Publisher_others.size)
)
plt.show()


