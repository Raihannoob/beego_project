package routers

import (
	"practice/controllers"
	beego "github.com/beego/beego/v2/server/web"
)

func init() {
    beego.Router("/", &controllers.MainController{})
	beego.Router("/GetData", &controllers.MainController{}, "*:GetData")

}
