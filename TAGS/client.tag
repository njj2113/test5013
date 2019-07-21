<client>
    <h1 class={shade} style={ backgrounder() }>Hello {username || 'there'}!</h1>
    <input type="text" ref="myUsername" onchange={ setUsername }>
    <p if={ !secret }>{ username } found the secret!</p>
    <button onclick={ unmount }>Unmount everything!</button>





    <script> //type="es6" to run eslint, but that's disabled for now
        // `this` refers to an instance of an element "client"
        console.dir(this);
        this.shade = "purpled"; //this allows you to pick which css classes will be used

        this.backgrounder = function() {
            var red = Math.floor(Math.random() * 255);
            var green = Math.floor(Math.random() * 255);
            var blue = Math.floor(Math.random() * 255);
            //console.log(blue,red,green);
            var colorList = [red, green, blue];
            var outcolor = "background-color:rgb(" + red.toString(10) + "," + green.toString(10) + "," + blue.toString(10) + ")";
            //console.log(outcolor);
            return outcolor;
        }

        this.on('mount', function(){
          alert("You mounted something!");
        })

        this.on('unmount', function(){
          alert("It seems you went ahead and unmounted what we needed to run the page :(");
        })

        this.username = "";
        this.secret = true;

        setUsername(e) {
            this.username = this.refs.myUsername.value.toUpperCase();
            console.dir(this);
            if (this.username.toLowerCase() == "orange")
            {
              this.shade = "oranged";
            }
            else if (this.username.toLowerCase() == "green")
            {
              this.shade = "greened";
            }
            else if (this.username.toLowerCase() == "purple")
            {
              this.shade = "purpled";
            }
            else if (this.username.toLowerCase() == "unlock")
            {
              this.secret = false;
            }
            else if (this.username.toLowerCase() == "lock")
            {
              this.secret = true;
            }


        }

    </script>

    <style>
        /* :scope refers to CSS rules applied to <client> element */
        :scope {
            display: block;
            text-transform: uppercase;
            text-align: center;
            /*background-color: red;*/
        }
    </style>
</client>
