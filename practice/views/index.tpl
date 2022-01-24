<!doctype html>
<html lang="en">

<head>
     <!-- Required meta tags -->
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



</head>
<body>   
    <title></title>
</head>

<body>
    <div class="container bg-transparent m-auto mt-5 " >
        <!-- ROW1 -->
            <div class="row  bg-light mb-2">
                    <div class="col-md-6  bg-light " style="position: relative">
                        <span>Order</span>
                        <select class="form-select" aria-label="Default select example">
                            <option selected value="Rand">Random</option>
                            <option value="Desc">Desc</option>
                            <option value="Asc">Asc</option>
                          </select>
                      

                    </div>

                    <div class="col-md-6 bg-light" style="position: relative">
                        <span>Type</span>  
                        <select class="form-select" aria-label="Default select example">
                            <option selected value="gif,jpg,png" >ALL</option>
                            <option value="gif">gif</option>
                            <option value="jpg">jpg</option>
                            <option value="png">png</option>
                          </select>



                    </div>
            </div>
                


        
        <!-- ROW2 -->    
            
                <div class="row  bg-light mb-5">
                        <div class="col-md-6 " style="position: relative">
                           
                        
                        

                            <span>Category</span>
                            <select class="form-select" aria-label="Default select example">
                                <option selected>None</option>
                                {{range $key, $val := .Categorie}} 
                                <option value="{{$val.Id}}">{{$val.Name}}</option>
                                {{end}}
                                
                              </select>

                         </div>
                        
                        <div class="col-md-6 " style="position: relative">
                            <span>Breed</span>
                            <select class="form-select" aria-label="Default select example">
                                <option selected>None</option>
                                {{range $key, $val := .Breed}} 
                                <option value="{{$val.Id}}">{{$val.Name}}</option>
                                {{end}}
                
                              </select>

                        </div>
                </div>


            <!-- ROW3 -->    
            
                <div class="row  bg-light mb-5">
                    {{range $val := .Images}} 
                         
                        <div class="col-md-4 mb-4" style="position: relative">
                            <img src="{{$val.Url}}" alt="Girl in a jacket" width="400px" height="500px"> 
                        </div>
                    {{end}}     
                </div>
                    


        

    </div>
  
   

</body>

</html>