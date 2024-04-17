/*
 * 发起http请求
 * */
// 1:导入http模块
import router from '@ohos.router';
import http from '@ohos.net.http'
import wallpaper from '@ohos.wallpaper';
import request from '@ohos.request';
@Entry
@Component
struct HttpReq {
  @State poem: string = '---欢迎来到诗词鉴赏---'
  @State from:string = '---等待5秒钟刷新---'
  @State value : number = 0

  aboutToAppear(){
    setInterval(()=>{
      this.value+=20
      if (this.value==120){
        this.value=0
      }
    },1000)

    setInterval(() => {
      // 2. 常见http请求对象
      let httpReq = http.createHttp()
      // 3. 发起请求
      httpReq.request('https://api.apiopen.top/api/sentences',
        {
          method:http.RequestMethod.GET,
        },
        (err,data) => {
          // 4. 处理结果
          if (!err) {
            this.poem = JSON.parse(`${data.result}`).result.name
            this.from = JSON.parse(`${data.result}`).result.from
          }
        }
      )
    },6000)
  }
  build() {
    Row() {
      Column() {
        Text(this.poem)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .copyOption(CopyOptions.InApp)
          .fontColor(Color.Blue)
          .margin({top:120,bottom:15})



        Text(this.from)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .copyOption(CopyOptions.InApp)
          .fontColor(Color.Red)



        //进度球
        LoadingProgress()
          .color(Color.Blue)
          .height(60)
          .width(60)
        Progress({ value:this.value, type: ProgressType.Linear })
          .width(200)
          .style({strokeWidth:10 ,})



        Button('返回', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(90)
          .height(40)
          .margin({top:300})
          .onClick(()=>{
            router.back()
          })

        Text('页面5~6秒钟会刷新古诗词可\n帮你更好的陶冶情操')
          .fontSize(18)
          .textAlign(TextAlign.Center)
          .fontWeight(FontWeight.Bold)
          .copyOption(CopyOptions.InApp)


      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)

    }
    .backgroundImage($r('app.media.bj4'),)
    .backgroundImageSize(ImageSize.Cover)
    .alignItems(VerticalAlign.Top)
    .height('100%')
  }
}