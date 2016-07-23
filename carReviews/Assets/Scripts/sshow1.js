

//configure the paths of the images, plus corresponding target links
slideshowimages("~/Assets/Images/sshow/images.jpg", "~/Assets/Images/sshow/images (1).jpg", "~/Assets/Images/sshow/images (2).jpg")

//configure the speed of the slideshow, in miliseconds
var slideshowspeed=4000

var whichimage=0

function slideit(){

if (!document.images)
return
document.images.slide.src=slideimages[whichimage].src

if (whichimage<slideimages.length-1)
whichimage++
else
    whichimage=0

setTimeout("slideit()",slideshowspeed)
}

slideit()

//-->