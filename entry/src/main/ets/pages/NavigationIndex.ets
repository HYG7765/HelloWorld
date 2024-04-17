import router from '@ohos.router';
import TitleBar from '../common/TitleBar'
import TImeA from  '../pages/TimeA'
import http from '@ohos.net.http'
@Entry
@Component
export default  struct NavigationIndex{
@State time : string = ''
@State date : string = ''
@State datetime : string = '2024-04-10 11:06:07'
@State weekday : string = '星期四'
  aboutToAppear(){
    //因为一秒一个请求会被api接口给屏蔽,所以得3秒一个请求
    setInterval(() => {
      // 2. 常见http请求对象
      let httpReq = http.createHttp()
      // 3. 发起请求
      httpReq.request('https://api.apiopen.top/api/getTime',
        {
          method:http.RequestMethod.GET,
        },
        (err,data) => {
          // 4. 处理结果
          if (!err) {
            this.date = JSON.parse(`${data.result}`).result.date
            this.time = JSON.parse(`${data.result}`).result.time
            this.datetime = JSON.parse(`${data.result}`).result.dateTime
            this.weekday = JSON.parse(`${data.result}`).result.weekday
          }else {
            this.date = 'error'
            this.time = 'error'
            this.datetime = 'error'
            this.weekday = 'error'
          }
        }
      )
    },3000)
  }
build(){
  Row() {
//todo 标记j
    Column() {
        Text('ShadowToolBox')
          .textAlign(TextAlign.Center)
          .fontSize(25)
          .width('100%')
      .onClick(()=>{
        router.pushUrl({url:'pages/TimeA'})
      })


        Text(this.datetime+'                       '+this.weekday)
          .textAlign(TextAlign.Start)
          .fontSize(18)
          .width('100%')
          .margin({top:10})


        // Text(this.weekday)
        //   .textAlign(TextAlign.End)
        //   .fontSize(14)
        //   .width('100%')


      Search({ placeholder: '输入功能名称' })
        .searchButton('搜索')
        .height(40)

      List() {
        //第1个备忘清单
        ListItem(){
          Row() {
            Image($r('app.media.bwqdA1'))
              .width(80)
              .height(80)
              .margin({ right: 20 })

            Column() {

              Text('备忘清单')
                .fontColor(Color.Red)
                .fontSize(20)
                .margin({ bottom: 8 })
              Text('一个记录待办事项的备忘清单')
                .fontSize(16)
                .fontColor(Color.Gray)
                .margin({ bottom: 8 })
            }
            .alignItems(HorizontalAlign.Start)
            .width('80%')
            .height('100%')
          }
          .padding(20)
          .borderRadius(12)
          .backgroundColor('#FFECECEC')
          .height(120)
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .margin({ top: 15 })
          .onClick(() => {
            router.push({ url: 'pages/SmartTaskIndex' })
          })}



      ListItem() {
        //第2个诗词鉴赏
        Row() {
          Image($r('app.media.bj4'))
            .width(80)
            .height(80)
            .margin({ right: 20 })

          Column() {

            Text('诗词鉴赏')
              .fontSize(20)
              .margin({ bottom: 8 })
            Text('收录着许多优美的诗词\n进去后需等待5秒钟刷新')
              .fontSize(16)
              .fontColor(Color.Gray)
              .margin({ bottom: 8 })
          }
          .alignItems(HorizontalAlign.Start)
          .width('80%')
          .height('100%')
        }
        .padding(20)
        .borderRadius(12)
        .backgroundColor('#FFECECEC')
        .height(120)
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .onClick(() => {
          router.push({ url: 'pages/PoetryIndex' })
        })
        .backgroundImage($r('app.media.bj4'),)
        .backgroundImageSize(ImageSize.Cover)
        .margin({ top: 15 })
      }





  //第3个小鱼动画游戏
        ListItem() {
  Row() {
    Image($r('app.media.mry'))
      .width(80)
      .height(80)
      .margin({ right: 20 })

    Column() {

      Text('小鱼动画游戏')
        .fontSize(20)
        .margin({ bottom: 8 })
      Text('玩家将控制小鱼移动')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ bottom: 8 })
    }
    .alignItems(HorizontalAlign.Start)
    .width('80%')
    .height('100%')
  }
  .padding(20)
  .borderRadius(12)
  .backgroundColor('#FFECECEC')
  .height(120)
  .width('100%')
  .justifyContent(FlexAlign.SpaceBetween)
  .margin({ top: 15 })
  .onClick(() => {
    router.push({ url: 'pages/AnimationPage' })
  })
}
        //第4个健康饮食
        ListItem() {
          Row() {
            Image($r('app.media.sg1'))
              .width(80)
              .height(80)
              .margin({ right: 20 })
            Column() {
              Text('健康饮食')
                .fontSize(20)
                .margin({ bottom: 8 })
              Text('帮助你规划更健康的饮食')
                .fontSize(16)
                .fontColor(Color.Gray)
                .margin({ bottom: 8 })
            }
            .alignItems(HorizontalAlign.Start)
            .width('80%')
            .height('100%')
          }
          .padding(20)
          .borderRadius(12)
          .backgroundColor('#FFECECEC')
          .height(120)
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .margin({ top: 15 })
          .onClick(() => {
            router.push({ url: 'pages/Logo' })
          })
        }



        //第5个快递查询
        ListItem() {
          Row() {
            Image($r('app.media.express'))
              .width(80)
              .height(80)
              .margin({ right: 20 })
            Column() {
              Text('快递查询')
                .fontSize(20)
                .margin({ bottom: 8 })
              Text('帮助你查询快递与签收情况')
                .fontSize(16)
                .fontColor(Color.Gray)
                .margin({ bottom: 8 })
            }
            .alignItems(HorizontalAlign.Start)
            .width('80%')
            .height('100%')
          }
          .padding(20)
          .borderRadius(12)
          .backgroundColor('#FFECECEC')
          .height(120)
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .margin({ top: 15 })
          .onClick(() => {
            router.push({ url: 'pages/ExpressInquiryComponent' })
          })
        }





        //第6个随机图片
        ListItem() {
          Row() {
            Image($r('app.media.bj5'))
              .width(80)
              .height(80)
              .margin({ right: 20 })
            Column() {
              Text('随机图片')
                .fontSize(20)
                .margin({ bottom: 8 })
              Text('许多好看且有趣的图片')
                .fontSize(16)
                .fontColor(Color.Gray)
                .margin({ bottom: 8 })
            }
            .alignItems(HorizontalAlign.Start)
            .width('80%')
            .height('100%')
          }
          .padding(20)
          .borderRadius(12)
          .backgroundColor('#FFECECEC')
          .height(120)
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .margin({ top: 15 })
          // .onClick(() => {
          //   router.push({ url: 'pages/RandomImages' })
          // })
        }.margin({bottom:110})







      }
      .scrollBar(BarState.Auto)
      Row(){
        Text()
      }
  }
  }
}
}