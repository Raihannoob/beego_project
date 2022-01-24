package controllers

import (
	beego "github.com/beego/beego/v2/server/web"
	
)
type ContactusController struct {
	beego.Controller
}

func (this *ContactusController) Get() {
	this.TplName = "contactusTemplate.tpl"
}

func (this *ContactusController) Post() {
	this.TplName = "thankyouTemplate.tpl"
	this.Data["name"] = this.GetString("name")
	this.Data["email"] = this.GetString("email")
}