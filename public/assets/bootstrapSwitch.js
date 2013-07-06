!function(t){"use strict";t.fn.bootstrapSwitch=function(e){var i={init:function(){return this.each(function(){var e,i,a,n,s,o,c=t(this),d="",r=c.attr("class"),h="YES",l="NO";t.each(["switch-mini","switch-small","switch-large"],function(t,e){r.indexOf(e)>=0&&(d=e)}),c.addClass("has-switch"),void 0!==c.data("on")&&(s="switch-"+c.data("on")),void 0!==c.data("on-label")&&(h=c.data("on-label")),void 0!==c.data("off-label")&&(l=c.data("off-label")),i=t("<span>").addClass("switch-left").addClass(d).addClass(s).html(h),s="",void 0!==c.data("off")&&(s="switch-"+c.data("off")),a=t("<span>").addClass("switch-right").addClass(d).addClass(s).html(l),n=t("<label>").html("&nbsp;").addClass(d).attr("for",c.find("input").attr("id")),e=c.find(":checkbox").wrap(t("<div>")).parent().data("animated",!1),c.data("animated")!==!1&&e.addClass("switch-animate").data("animated",!0),e.append(i).append(n).append(a),c.find(">div").addClass(c.find("input").is(":checked")?"switch-on":"switch-off"),c.find("input").is(":disabled")&&t(this).addClass("deactivate");var u=function(t){t.siblings("label").trigger("mousedown").trigger("mouseup").trigger("click")};c.on("keydown",function(e){32===e.keyCode&&(e.stopImmediatePropagation(),e.preventDefault(),u(t(e.target).find("span:first")))}),i.on("click",function(){u(t(this))}),a.on("click",function(){u(t(this))}),c.find("input").on("change",function(e){var i=t(this).parent();e.preventDefault(),e.stopImmediatePropagation(),i.css("left",""),t(this).is(":checked")?i.removeClass("switch-off").addClass("switch-on"):i.removeClass("switch-on").addClass("switch-off"),i.data("animated")!==!1&&i.addClass("switch-animate"),i.parent().trigger("switch-change",{el:t(this),value:t(this).is(":checked")})}),c.find("label").on("mousedown touchstart",function(e){var i=t(this);o=!1,e.preventDefault(),e.stopImmediatePropagation(),i.closest("div").removeClass("switch-animate"),i.closest(".switch").is(".deactivate")?i.unbind("click"):(i.on("mousemove touchmove",function(e){var i=t(this).closest(".switch"),a=(e.pageX||e.originalEvent.targetTouches[0].pageX)-i.offset().left,n=100*(a/i.width()),s=25,c=75;o=!0,s>n?n=s:n>c&&(n=c),i.find(">div").css("left",n-c+"%")}),i.on("click touchend",function(e){var i=t(this),a=t(e.target),n=a.siblings("input");e.stopImmediatePropagation(),e.preventDefault(),i.unbind("mouseleave"),o?n.prop("checked",!(parseInt(i.parent().css("left"))<-25)):n.prop("checked",!n.is(":checked")),o=!1,n.trigger("change")}),i.on("mouseleave",function(e){var i=t(this),a=i.siblings("input");e.preventDefault(),e.stopImmediatePropagation(),i.unbind("mouseleave"),i.trigger("mouseup"),a.prop("checked",!(parseInt(i.parent().css("left"))<-25)).trigger("change")}),i.on("mouseup",function(e){e.stopImmediatePropagation(),e.preventDefault(),t(this).unbind("mousemove")}))})})},toggleActivation:function(){t(this).toggleClass("deactivate")},isActive:function(){return!t(this).hasClass("deactivate")},setActive:function(e){e?t(this).removeClass("deactivate"):t(this).addClass("deactivate")},toggleState:function(e){var i=t(this).find("input:checkbox");i.prop("checked",!i.is(":checked")).trigger("change",e)},setState:function(e,i){t(this).find("input:checkbox").prop("checked",e).trigger("change",i)},status:function(){return t(this).find("input:checkbox").is(":checked")},destroy:function(){var e,i=t(this).find("div");return i.find(":not(input:checkbox)").remove(),e=i.children(),e.unwrap().unwrap(),e.unbind("change"),e}};return i[e]?i[e].apply(this,Array.prototype.slice.call(arguments,1)):"object"!=typeof e&&e?(t.error("Method "+e+" does not exist!"),void 0):i.init.apply(this,arguments)}}(jQuery),$(function(){$(".switch").bootstrapSwitch()});