## 實作說明
### load資料
1. 先將網址字串轉成URL，並且使用URLSession的dataTask方法來下載資料。
2. 首先先判斷有沒有錯誤，如果error不等於nil就直接退出，如果沒有錯誤則用JSONSerialization.jsonObject將資料轉成Json格式。
3. 最後將載入的資料解析出key為origin值，並且用NSLog方法將資料輸出。

### post資料
1. 將post的網址轉換成URL，並且將URL轉換成URLRequest並且存在一個變數裡面，並且設定httpMethed方法為post。
2. 接下來設定時間以及利用DateFormatter來設定時間格式，並將時間數計轉換成字串。
3. 再來將資料post上去，最後將上傳的時間跟現在時間相減後的結果用NSLog輸出。


#### 參考連結
[NSLog參考](http://fecbob.pixnet.net/blog/post/35707407-nslog%E8%BC%B8%E5%87%BA%E6%A0%BC%E5%BC%8F)

[Post參考](http://stackoverflow.com/questions/26364914/http-request-in-swift-with-post-method)

[Date參考](http://www.jianshu.com/p/a6275cc54e04)
