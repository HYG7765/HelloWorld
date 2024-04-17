// xxx.ets
import promptAction from '@ohos.promptAction';

@Entry
@Component
export default struct ToggleExample {
  build() {
    Column() {
      Row() {
        Text("设置")
          .height(50)
          .fontSize(30)
      }

      //第一行
      Row() {
        Text("自动启动")
          .height(50)
          .padding({ left: 10 })
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .backgroundColor(0xFFFFFF)
        Toggle({ type: ToggleType.Switch })
          .margin({ left: 200, right: 10 })
          .onChange((isOn: boolean) => {


            //待开发
            if (isOn) {
              promptAction.showToast({ message: '自动启动开启.' })
            } else {
              promptAction.showToast({ message: '自动启动关闭.' })
            }
          })
      }
      .backgroundColor(0xFFFFFF)

      //第二行
      Row() {
        Text("自动清理软件缓存")
          .height(50)
          .padding({ left: 10 })
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .backgroundColor(0xFFFFFF)
        Toggle({ type: ToggleType.Switch })
          .margin({ left: 145, right: 20 })
          .onChange((isOn: boolean) => {
            if (isOn) {
              promptAction.showToast({ message: '自动清理缓存已开启.' })
            } else {
              promptAction.showToast({ message: '自动清理缓存已关闭.' })
            }
          })
      }
      .backgroundColor(0xFFFFFF)

    }
    .padding(10)
    .width('100%')
    .height('100%')
  }
}