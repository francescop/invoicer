/**
 * --------------------------------------------------------------------
 * Tooltip plugin for the jQuery-Plugin "Visualize"
 * Tolltip by IraĂŞ Carvalho, irae@irae.pro.br, http://irae.pro.br/en/
 * Copyright (c) 2010 IraĂŞ Carvalho
 * Dual licensed under the MIT (filamentgroup.com/examples/mit-license.txt) and GPL (filamentgroup.com/examples/gpl-license.txt) licenses.
 * 	
 * Visualize plugin by Scott Jehl, scott@filamentgroup.com
 * Copyright (c) 2009 Filament Group, http://www.filamentgroup.com
 *
 * --------------------------------------------------------------------
 */
!function(t){t.visualizePlugins.push(function(o){var i=t.extend({tooltip:!1,tooltipalign:"auto",tooltipvalign:"top",tooltipclass:"visualize-tooltip",tooltiphtml:function(t){if(o.multiHover){for(var i="",l=0;l<t.point.length;l++)i+="<p>"+t.point[l].value+" - "+t.point[l].yLabels[0]+"</p>";return i}return"<p>"+t.point.value+" - "+t.point.yLabels[0]+"</p>"},delay:!1},o);if(i.tooltip){var l=t(this),a=l.next(),e=a.find(".visualize-scroller"),s=e.width(),n=a.find(".visualize-interaction-tracker");n.css({backgroundColor:"white",opacity:0,zIndex:100});var r=t('<div class="'+i.tooltipclass+'"/>').css({position:"absolute",display:"none",zIndex:90}).insertAfter(e.find("canvas")),p=!0;"undefined"!=typeof G_vmlCanvasManager&&(e.css({position:"absolute"}),n.css({marginTop:"-"+i.height+"px"})),l.bind("vizualizeOver",function(o,l){if(l.canvasContain.get(0)==a.get(0)){if(i.multiHover)var n=l.point[0].canvasCords;else var n=l.point.canvasCords;var c,d,v,u=Math.round(n[0]+l.tableData.zeroLocX),f=Math.round(n[1]+l.tableData.zeroLocY);"left"==i.tooltipalign||"auto"==i.tooltipalign&&u-e.scrollLeft()<=s/2?(p=!t.browser.msie||7!=t.browser.version&&6!=t.browser.version?!0:!1,c=u-(p?e.scrollLeft():0)+"px",d="",clasAdd="tooltipleft",v="tooltipright"):(p=t.browser.msie&&7==t.browser.version?!1:!0,c="",d=Math.abs(u-i.width)-(i.width-(p?e.scrollLeft():0)-s)+"px",clasAdd="tooltipright",v="tooltipleft"),r.addClass(clasAdd).removeClass(v).html(i.tooltiphtml(l)).css({display:"block",top:f+"px",left:c,right:d})}}),l.bind("vizualizeOut",function(){r.css({display:"none"})})}})}(jQuery);