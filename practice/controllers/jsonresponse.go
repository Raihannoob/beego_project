package controllers

import (
    beego "github.com/beego/beego/v2/server/web"
)

type ErrorController struct {
    beego.Controller
}

type ErrorJson struct {
    S string `json:"S"`
    D string `json:"D"`
}

func (this *ErrorController) Get() {

    var responseJson ErrorJson
    responseJson = ErrorJson{
        S: "asdf",
        D: "qwer",
    }

    this.Data["json"] = responseJson
    this.TplName = "json.tpl"
}