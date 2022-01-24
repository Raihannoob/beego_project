<!DOCTYPE html>

<html>
    <head>
        <title>Beego</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    </head>
    <body>
        <header class="hero-unit" style="background-color:#A9F16C">
            <div class="container">
                <div class="row">
                    <div class="hero-text">
                       <div class="row">
                            <div class="col-md-12" role="main">
                                <div class="post-container">     
                                    <div class="post-content">
                                        {{if .name}}
                                            Thank you, {{.name}}, we update you on {{.email}}.
                                        {{end}}		 
                                    </div>
                            
                                </div>
                            </div>
                        </div>   
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>