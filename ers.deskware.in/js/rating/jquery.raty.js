!function(a){var b={init:function(c){return this.each(function(){b.destroy.call(this),this.opt=a.extend(!0,{},a.fn.raty.defaults,c);var d=a(this),e=["number","readOnly","score","scoreName"];b._callback.call(this,e),this.opt.precision&&b._adjustPrecision.call(this),this.opt.number=b._between(this.opt.number,0,this.opt.numberMax),this.opt.path=this.opt.path||"",this.opt.path&&"/"!==this.opt.path.charAt(this.opt.path.length-1)&&(this.opt.path+="/"),this.stars=b._createStars.call(this),this.score=b._createScore.call(this),b._apply.call(this,this.opt.score);var f=this.opt.space?4:0,g=this.opt.width||this.opt.number*this.opt.size+this.opt.number*f;this.opt.cancel&&(this.cancel=b._createCancel.call(this),g+=this.opt.size+f),this.opt.readOnly?b._lock.call(this):(d.css("cursor","pointer"),b._binds.call(this)),this.opt.width!==!1&&d.css("width",g),b._target.call(this,this.opt.score),d.data({settings:this.opt,raty:!0})})},_adjustPrecision:function(){this.opt.targetType="score",this.opt.half=!0},_apply:function(a){a&&a>0&&(a=b._between(a,0,this.opt.number),this.score.val(a)),b._fill.call(this,a),a&&b._roundStars.call(this,a)},_between:function(a,b,c){return Math.min(Math.max(parseFloat(a),b),c)},_binds:function(){this.cancel&&b._bindCancel.call(this),b._bindClick.call(this),b._bindOut.call(this),b._bindOver.call(this)},_bindCancel:function(){b._bindClickCancel.call(this),b._bindOutCancel.call(this),b._bindOverCancel.call(this)},_bindClick:function(){var b=this,c=a(b);b.stars.on("click.raty",function(a){b.score.val(b.opt.half||b.opt.precision?c.data("score"):this.alt),b.opt.click&&b.opt.click.call(b,parseFloat(b.score.val()),a)})},_bindClickCancel:function(){var a=this;a.cancel.on("click.raty",function(b){a.score.removeAttr("value"),a.opt.click&&a.opt.click.call(a,null,b)})},_bindOut:function(){var c=this;a(this).on("mouseleave.raty",function(a){var d=parseFloat(c.score.val())||void 0;b._apply.call(c,d),b._target.call(c,d,a),c.opt.mouseout&&c.opt.mouseout.call(c,d,a)})},_bindOutCancel:function(){var b=this;b.cancel.on("mouseleave.raty",function(c){a(this).attr("src",b.opt.path+b.opt.cancelOff),b.opt.mouseout&&b.opt.mouseout.call(b,b.score.val()||null,c)})},_bindOverCancel:function(){var c=this;c.cancel.on("mouseover.raty",function(d){a(this).attr("src",c.opt.path+c.opt.cancelOn),c.stars.attr("src",c.opt.path+c.opt.starOff),b._target.call(c,null,d),c.opt.mouseover&&c.opt.mouseover.call(c,null)})},_bindOver:function(){var c=this,d=a(c),e=c.opt.half?"mousemove.raty":"mouseover.raty";c.stars.on(e,function(e){var f=parseInt(this.alt,10);if(c.opt.half){var g=parseFloat((e.pageX-a(this).offset().left)/c.opt.size),h=g>.5?1:.5;f=f-1+h,b._fill.call(c,f),c.opt.precision&&(f=f-h+g),b._roundStars.call(c,f),d.data("score",f)}else b._fill.call(c,f);b._target.call(c,f,e),c.opt.mouseover&&c.opt.mouseover.call(c,f,e)})},_callback:function(a){for(var b in a)"function"==typeof this.opt[a[b]]&&(this.opt[a[b]]=this.opt[a[b]].call(this))},_createCancel:function(){var b=a(this),c=this.opt.path+this.opt.cancelOff,d=a("<img />",{src:c,alt:"x",title:this.opt.cancelHint,class:"raty-cancel"});return"left"==this.opt.cancelPlace?b.prepend("&#160;").prepend(d):b.append("&#160;").append(d),d},_createScore:function(){return a("<input />",{type:"hidden",name:this.opt.scoreName}).appendTo(this)},_createStars:function(){for(var c=a(this),d=1;d<=this.opt.number;d++){var e=b._getHint.call(this,d),f=this.opt.score&&this.opt.score>=d?"starOn":"starOff";f=this.opt.path+this.opt[f],a("<img />",{src:f,alt:d,title:e}).appendTo(this),this.opt.space&&c.append(d<this.opt.number?"&#160;":"")}return c.children("img")},_error:function(b){a(this).html(b),a.error(b)},_fill:function(a){for(var b=this,c=0,d=1;d<=b.stars.length;d++){var e=b.stars.eq(d-1),f=b.opt.single?d==a:d<=a;if(b.opt.iconRange&&b.opt.iconRange.length>c){var g=b.opt.iconRange[c],h=g.on||b.opt.starOn,i=g.off||b.opt.starOff,j=f?h:i;d<=g.range&&e.attr("src",b.opt.path+j),d==g.range&&c++}else{var j=f?"starOn":"starOff";e.attr("src",this.opt.path+this.opt[j])}}},_getHint:function(a){var b=this.opt.hints[a-1];return""===b?"":b||a},_lock:function(){var c=parseInt(this.score.val(),10),d=c?b._getHint.call(this,c):this.opt.noRatedMsg;a(this).data("readonly",!0).css("cursor","").attr("title",d),this.score.attr("readonly","readonly"),this.stars.attr("title",d),this.cancel&&this.cancel.hide()},_roundStars:function(a){var b=(a-Math.floor(a)).toFixed(2);if(b>this.opt.round.down){var c="starOn";this.opt.halfShow&&b<this.opt.round.up?c="starHalf":b<this.opt.round.full&&(c="starOff"),this.stars.eq(Math.ceil(a)-1).attr("src",this.opt.path+this.opt[c])}},_target:function(c,d){if(this.opt.target){var e=a(this.opt.target);0===e.length&&b._error.call(this,"Target selector invalid or missing!"),this.opt.targetFormat.indexOf("{score}")<0&&b._error.call(this,'Template "{score}" missing!');var f=d&&"mouseover"==d.type;void 0===c?c=this.opt.targetText:null===c?c=f?this.opt.cancelHint:this.opt.targetText:("hint"==this.opt.targetType?c=b._getHint.call(this,Math.ceil(c)):this.opt.precision&&(c=parseFloat(c).toFixed(1)),f||this.opt.targetKeep||(c=this.opt.targetText)),c&&(c=this.opt.targetFormat.toString().replace("{score}",c)),e.is(":input")?e.val(c):e.html(c)}},_unlock:function(){a(this).data("readonly",!1).css("cursor","pointer").removeAttr("title"),this.score.removeAttr("readonly","readonly");for(var c=0;c<this.opt.number;c++)this.stars.eq(c).attr("title",b._getHint.call(this,c+1));this.cancel&&this.cancel.css("display","")},cancel:function(c){return this.each(function(){a(this).data("readonly")!==!0&&(b[c?"click":"score"].call(this,null),this.score.removeAttr("value"))})},click:function(c){return a(this).each(function(){a(this).data("readonly")!==!0&&(b._apply.call(this,c),this.opt.click||b._error.call(this,'You must add the "click: function(score, evt) { }" callback.'),this.opt.click.call(this,c,a.Event("click")),b._target.call(this,c))})},destroy:function(){return a(this).each(function(){var b=a(this),c=b.data("raw");c?b.off(".raty").empty().css({cursor:c.style.cursor,width:c.style.width}).removeData("readonly"):b.data("raw",b.clone()[0])})},getScore:function(){var b,c=[];return a(this).each(function(){b=this.score.val(),c.push(b?parseFloat(b):void 0)}),c.length>1?c:c[0]},readOnly:function(c){return this.each(function(){var d=a(this);d.data("readonly")!==c&&(c?(d.off(".raty").children("img").off(".raty"),b._lock.call(this)):(b._binds.call(this),b._unlock.call(this)),d.data("readonly",c))})},reload:function(){return b.set.call(this,{})},score:function(){return arguments.length?b.setScore.apply(this,arguments):b.getScore.call(this)},set:function(b){return this.each(function(){var c=a(this),d=c.data("settings"),e=a.extend({},d,b);c.raty(e)})},setScore:function(c){return a(this).each(function(){a(this).data("readonly")!==!0&&(b._apply.call(this,c),b._target.call(this,c))})}};a.fn.raty=function(c){return b[c]?b[c].apply(this,Array.prototype.slice.call(arguments,1)):"object"!=typeof c&&c?void a.error("Method "+c+" does not exist!"):b.init.apply(this,arguments)},a.fn.raty.defaults={cancel:!1,cancelHint:"Cancel this rating!",cancelOff:"cancel-off.png",cancelOn:"cancel-on.png",cancelPlace:"left",click:void 0,half:!1,halfShow:!0,hints:["bad","poor","regular","good","gorgeous"],iconRange:void 0,mouseout:void 0,mouseover:void 0,noRatedMsg:"Not rated yet!",number:5,numberMax:20,path:"",precision:!1,readOnly:!1,round:{down:.25,full:.6,up:.76},score:void 0,scoreName:"score",single:!1,size:16,space:!0,starHalf:"star-half.png",starOff:"star-off.png",starOn:"star-on.png",target:void 0,targetFormat:"{score}",targetKeep:!1,targetText:"",targetType:"hint",width:void 0}}(jQuery);