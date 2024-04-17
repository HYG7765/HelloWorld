import router from '@ohos.router'
import Home from '../view/Home';
import ToDoList from '../view/ToDoList';
import ToggleExample from './SettingIndex';
import NavigationIndex from './NavigationIndex';
@Entry
@Component
struct Index{
  @State message:String = "Hello World"
  private Controller: TabsController = new TabsController();
  build(){
    Tabs({
      barPosition:BarPosition.End,
      controller:this.Controller
    })


    {

      TabContent(){
        NavigationIndex()
      }
      .padding({ left: $r('app.float.mainPage_padding'), right: $r('app.float.mainPage_padding') })
      // .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar('首页')

      TabContent(){
        ToggleExample()
      }
      .tabBar('设置')
      .padding({ left: $r('app.float.mainPage_padding'), right: $r('app.float.mainPage_padding') })
      // .backgroundColor($r('app.color.mainPage_backgroundColor'))

    }.scrollable(false)
        }
      }