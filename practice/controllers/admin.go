package controllers

import (
	beego "github.com/beego/beego/v2/server/web"
)

type UserController struct {
	beego.Controller
}

func (c *UserController) Get() {
	c.Data["Website"] = "Raihan"
	c.Data["Email"] = "tanvir@gmail.com"
	c.TplName = "index.tpl"
}

func (c *UserController) Abcd() {
	c.Data["Website"] = "Raihan"
	c.Data["Email"] = "tanvir@gmail.com"
	c.TplName = "index.tpl"
}
