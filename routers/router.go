package routers

import (
	"practice/controllers"
	beego "github.com/beego/beego/v2/server/web"
)

func init() {
    beego.Router("/", &controllers.MainController{})
	beego.Router("/admin", &controllers.UserController{})
	beego.Router("/admin/abcd", &controllers.UserController{},"get:Abcd")
	beego.Router("/api", &controllers.ErrorController{})
}
