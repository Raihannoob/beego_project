<!doctype html>
<html lang="en">

<head>
     <!-- Required meta tags -->
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


</head>
<body>   
    <title></title>
</head>

<body>
    <div class="container bg-transparent m-auto mt-5 " >
        <!-- ROW1 -->
            <div class="row  bg-light mb-2">
                    <div class="col-md-6  bg-light " style="position: relative">
                        <label class="form-label">Order</label>
                        <select id="order" class="form-select" aria-label="Default select example">
                            <option selected value="">Random</option>
                            <option value="DESC">DESC</option>
                            <option value="ASC">ASC</option>
                          </select>
                      

                    </div>

                    <div class="col-md-6 bg-light" style="position: relative">
                        <label class="form-label">Type</label> 
                        <select id="mime_types" class="form-select" aria-label="Default select example">
                            <option selected value="" >ALL</option>
                            <option value="png,jpg">Static</option>
                            <option value="gif">Animated</option>
                          </select>



                    </div>
            </div>
                


        
        <!-- ROW2 -->    
            
                <div class="row  bg-light mb-5">
                        <div class="col-md-6 " style="position: relative">
                           
                        
                        

                            <label class="form-label">Category</label> 
                            <select id="category" class="form-select" aria-label="Default select example">
                                <option value="" selected>None</option>
                                {{range $key, $val := .Categorie}} 
                                <option value="{{$val.Id}}">{{$val.Name}}</option>
                                {{end}}  
                              </select>

                         </div>
                        
                        <div class="col-md-6 " style="position: relative">
                            <label class="form-label">Breed</label> 
                            <select id="breed" class="form-select" aria-label="Default select example">
                                <option value="" selected>None</option>
                                {{range $key, $val := .Breed}} 
                                <option value="{{$val.Id}}">{{$val.Name}}</option>
                                {{end}}
                              </select>

                        </div>
                        
                </div>


            <!-- ROW3 -->    
            
                <div id="image" class="row  bg-light mb-3">
                    {{range $val := .images}} 
                         
                        <div  class="col-md-4 mb-4" style="height: 280px; width: 440px;">
                            <!-- <img src="" alt="" width="400px" height="500px"> -->
                        <div style="background-image: url({{$val.Url}}); height:280px; background-size: cover; background-repeat:no-repeat;">
                            
                        </div>
                        </div>
                        
                    {{end}} 



                </div>
                <div class="row  bg-light mb-2">
                    
                        <div class="col-md-4 mb-4" style="position: relative">
                            <label class="form-label">Per Page</label> 
                              <select id="limit" class="form-select">
                                <option value="3">3</option>
                                <option value="6">6</option>
                                <option value="9" selected>9</option>
                                <option value="18">18</option>
                                <option value="24">24</option>
                                <option value="30">30</option>
                                <option value="40">40</option>
                                <option value="50">50</option>
                              </select>
                        </div>
                        <div class="col-md-4  mt-4" style="position: relative">
                          
                          <button type="button" id="page" value="0" class="btn btn-primary btn-block">More</button>
                      </div>
                      
                </div>
                    


        

    </div>
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script>
   $(document).on('change', 'select', function() {
    
      let breed = $('#breed').val();
      let order = $('#order').val();
      let mime_types = $('#mime_types').val();
      let category = $('#category').val();
      let limit = $('#limit').val();
      let page = 0;
      document.getElementById("page").value= 0;
      $.ajax({
        type: 'GET',
        url: 'http://localhost:8080/GetData',
        data: {
          "order": order,
          "mime_types": mime_types,
          "category": category,
          "breed": breed,
          "limit": limit,
          "page":page
        },
        success: function(response) {
          let data = response;
          let html = "";
          $.each(data, function(key, value) {
            console.log(value.url);
          })
          $.each(data, function(key, value) {
            html += '<div class="col-md-4 mb-4" style=" height: 280px; width: 440px;">',
            html += '<div style="background-image: url('+value.url+'); height:280px; background-size: cover; background-repeat:no-repeat;"></div>',
            html += '</div>'
          })
          $("#image").html(html);
        },
        error: function(error) {
          console.log(error)
        }
      })
    });




    $(document).on('click', 'button', function() {
    
    let breed = $('#breed').val();
    let order = $('#order').val();
    let mime_types = $('#mime_types').val();
    let category = $('#category').val();
    let limit = $('#limit').val();
    let page = document.getElementById("page").value = parseInt(document.getElementById("page").value) + 1;
    console.log(page); 
    $.ajax({
      type: 'GET',
      url: 'http://localhost:8080/GetData',
      data: {
        "order": order,
        "mime_types": mime_types,
        "category": category,
        "breed": breed,
        "limit": limit,
        "page": page
      },
      success: function(response) {
        let data = response;
        let html = "";
        $.each(data, function(key, value) {
          console.log(value.url);
        })
        $.each(data, function(key, value) {
          html += '<div class="col-md-4 mb-4" style=" height: 280px; width: 440px;">',
          html += '<div style="background-image: url('+value.url+'); height:280px; background-size: cover; background-repeat:no-repeat;"></div>',
          html += '</div>'
        })
        $("#image").html(html);
      },
      error: function(error) {
        console.log(error)
      }
    })
  });
  </script>

</body>

</html>