/******************************************
   * Scrollable content script II- © Dynamic Drive (www.dynamicdrive.com)
   * Visit http://www.dynamicdrive.com/ for full source code
   * This notice must stay intact for use
   ******************************************/

// modified 17-October-2011


function move(id, spd) {
    var obj = document.getElementById(id), max = -obj.offsetHeight + obj.parentNode.offsetHeight, top = parseInt(obj.style.top);
    if ((spd > 0 && top <= 0) || (spd < 0 && top >= max)) {
        obj.style.top = top + spd + "px";
        move.to = setTimeout(function () { move(id, spd); }, 20);
    }
    else {
        obj.style.top = (spd > 0 ? 0 : max) + "px";
    }
}