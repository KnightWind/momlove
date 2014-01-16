
var height = "width=\"68\"";
var target = "target=\"_blank\"";
var photoUrl = "avatarUrl";//fakeAvatar

function getPhotohtml(obj){
	var desc = obj.photodesc;
	if(desc.length>120)desc = desc.substring(0,90)+".....";
	var html = [];
	html.push("<li class='b-dashed clearfix'>");
	html.push("<a class=\"fl empoy-job\" href=\""+"/view/"+obj.id+"\" >");
	html.push("<img ");
	html.push(height);
	html.push("class=\"employ-image\" src=\""+obj.avatarUrl+"\" alt=\"\" /></a>");
	html.push("<div class=\"employ-info\">");
	html.push("<p><a class=\"empoy-job\" href=\""+"/view/"+obj.id+"\" >"+obj.title+"</a></p>");
	html.push("<p><a class=\"empoy-enname\" href=\""+"/view/"+obj.id+"\" >"+desc+"</a></p>");
	html.push("</div>");
	html.push("</li>");
	return html.join("");
}

function getInfohtml(obj){
	var html = [];
	html.push("<li class='clearfix'><a class=\"li-smalll-width nobr\" href=\"");
	html.push("/view/"+obj.id+"\"");
	html.push("title=\""+obj.title+"\"");
	html.push(">");
	html.push("<i class=\"icon icon-arrow\">");
	html.push("</i>");
	html.push(obj.title);
	html.push("</a></li>");
	return html.join("");
}

function getInfoWithTimeHtml(obj){
	//console.log("---- 加载");
	
	var time = obj.updateTime || "";
	if(time.length>10)time = time.substring(0,time.length-6);
	var html = [];
	html.push("<li class='clearfix'><a class=\"li-smalll-width nobr\" href=\"");
	html.push("/view/"+obj.id+"\"");
	html.push(" title=\""+obj.title+"\" ")
	html.push(">");
	html.push("<i class=\"icon icon-arrow\">");
	html.push("</i>");
	html.push(obj.title);
	html.push("</a>");
	html.push("<span class=\"time\">"+time+"</span>");
	html.push("</li>");
	return html.join("");
}

function loadData(callback){
		/**if($("#ul_bjsales").length>0){
			$("#ul_bjsales").empty();
			if(typeof(bjsales)!="undefined" && bjsales){
				for(var i=0;i<bjsales.length;i++){
					var obj = bjsales[i];
					var html = getPhotohtml(obj);
					$("#ul_bjsales").append(html);
				}
			}
		}
		
		if($("#ul_shsales").length>0){
			$("#ul_shsales").empty();
			if(typeof(shsales)!="undefined" && shsales){
				for(var i=0;i<shsales.length;i++){
					var obj = shsales[i];
					var html = getPhotohtml(obj);
					$("#ul_shsales").append(html);
				}
			}
		}*/
		//优秀员工
		if($("#ul_excellenters").length>0){
			$("#ul_excellenters").empty();
			if(typeof(excellenters)!="undefined" && excellenters){
				for(var i=0;i<excellenters.length;i++){
					var obj = excellenters[i];
					//var html = getPhotohtml(obj);
					var html = [];
					html.push("<li>");
					html.push("<div style=\"width: 68px; max-height: 110px; overflow: hidden; text-align:center;margin: 0 auto;\" >");
					html.push("<a  class=\"fl\" href=\""+"/view/"+obj.id+"\"  >");
					html.push("<img  width=\"68\" "); // height=\"96\"
					html.push(" src=\""+obj.avatarUrl+"\" alt=\""+obj.title+"\" /></a></div>");
					//html.push("<p><a href=\""+"/view/"+obj.id+"\"  >"+obj.title+"</a></p>");
					html.push("</li>");
					
					$("#ul_excellenters").append(html.join(""));
				}
			}
		}
		
		//新人秀
		/**if($("#ul_newers").length>0){
			$("#ul_newers").empty();
			if(typeof(newers)!="undefined" && newers){
				for(var i=0;i<newers.length;i++){
					var obj = newers[i];
					var html = getPhotohtml(obj);
					$("#ul_newers").append(html);
				}
			}
		}*/
		
		//团队活动
		if($("#ul_groupactives").length>0){
			$("#ul_groupactives").empty();
			if(typeof(groupactives)!="undefined" && groupactives){
				for(var i=0;i<groupactives.length;i++){
					var obj = groupactives[i];
					var html = [];
					html.push("<li>");
					html.push("<div style=\"width: 150px; max-height: 100px; overflow: hidden; text-align:center;margin: 0 auto;\" >");
					html.push("<a  class=\"fl\" href=\""+"/view/"+obj.id+"\"  ><img style=\"max-height: 100px;\" width=\"150\"  src=\""+obj.avatarUrl+"\" alt=\""+obj.title+"\" /></a>");
					html.push("</div></li>");
					$("#ul_groupactives").append(html.join(""));
				}
			}
		}
		
		//常用流程
		if($("#ul_commonflow").length>0){
			$("#ul_commonflow").empty();
			if(typeof(commonflow)!="undefined" && commonflow){
				for(var i=0;i<commonflow.length;i++){
					var obj = commonflow[i];
					var html = getInfohtml(obj);
					$("#ul_commonflow").append(html);
				}
			}
		}
		//常用软件
		if($("#ul_softwares").length>0){
			$("#ul_softwares").empty();
			if(typeof(softwares)!="undefined" && softwares){
				for(var i=0;i<softwares.length;i++){
					var obj = softwares[i];
					var html = getInfohtml(obj);
					$("#ul_softwares").append(html);
				}
			}
		}
		
		//常用申请单
		if($("#ul_application").length>0){
			$("#ul_application").empty();
			 
			if(typeof(application)!="undefined" && application){
				for(var i=0;i<application.length;i++){
					var obj = application[i];
					var html = getInfohtml(obj);
					$("#ul_application").append(html);
				}
			}
		}
		
		//首页公共牌信息
		if($("#ul_bizplacard").length>0){
			$("#ul_bizplacard").empty();
			var arr = [];
			
			if(typeof(bizplacard)!="undefined" && bizplacard){
				for(var i=0;i<bizplacard.length;i++){
					arr.push(bizplacard[i]);
				}
			}
			
			if(typeof(operations)!="undefined" && operations){
				for(var i=0;i<operations.length;i++){
					arr.push(operations[i]);
				}
			}
			
			if(typeof(marketing)!="undefined" && marketing){
				for(var i=0;i<marketing.length;i++){
					arr.push(marketing[i]);
				}
			}
			
			if(typeof(sales)!="undefined" && sales){
				for(var i=0;i<sales.length;i++){
					arr.push(sales[i]);
				}
			}
			
			if(typeof(finance)!="undefined" && finance){
				for(var i=0;i<finance.length;i++){
					arr.push(finance[i]);
				}
			}
			
			if(typeof(admin)!="undefined" && admin){
				for(var i=0;i<admin.length;i++){
					arr.push(admin[i]);
				}
			}
			
			if(arr.length>0){
				arr.sort(function(x,y){
					if(Date.parse(x.updateTime)>Date.parse(y.updateTime)){
	        			return -1
	        		}else if (Date.parse(x.updateTime)<Date.parse(y.updateTime)){
	        			return 1;
	        		}
				});
				//arr.reverse();
				//alert("length="+arr.length);
				var index = 0;
				for(var i=arr.length-1;i>=0;i--){
					var obj = arr[i];
					//alert(obj.updateTime);
					var html = getInfoWithTimeHtml(obj);
					$("#ul_bizplacard").append(html);
					if((arr.length - i)>14) break;
				}
			}
		}
		
		if(callback && jQuery.isFunction(callback)){
			
			callback();
		}
		
		return true;
	}

function showMore(moduleId){
	//alert("cccc"+moduleId);
	parent.openModule(moduleId);
}