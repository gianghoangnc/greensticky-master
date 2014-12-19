var baseUrl =   'http://localhost:50/cubetboard-master/';
(function () {

	function getBaseURL()
	{
  		return location.protocol + "//" + location.hostname + (location.port && ":" + location.port) + "/";
    }


    function m() {
        return /msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent)
    }

	function w() {
        return /Safari/.test(navigator.userAgent) && !/Chrome/.test(navigator.userAgent)
    }

    function x() {
        return navigator.userAgent.match(/iPad/i) != null || navigator.userAgent.match(/iPhone/i) != null || navigator.userAgent.match(/iPod/i) != null
    }

    function t() {

        var a = window,
            b = document;


        return ("" + (a.getSelection ? a.getSelection() : b.getSelection ? b.getSelection() : b.selection.createRange().text)).replace(/(^\s+|\s+$)/g, "")
    }

    function y(a) {
        var b = a.src == location.href ? document.referrer || location.href : location.href;
        if (w()) b = encodeURI(b);
        b = {
            url: a.src,
            url1: b,
            alt: a.alt,
            title: document.title,
            is_video: a.type == "video"
        };
        if (r) b.description = r;
        a = [];
        a.push(z);
        a.push("?");
        for (var d in b) {
            a.push(encodeURIComponent(d));
            a.push("=");
            a.push(encodeURIComponent(b[d]));
            a.push("&")
        }
        var f = [];
        f.push(A);
        f.push("?");
        for (d in b) {
            f.push(encodeURIComponent(d));
            f.push("=");
            f.push(encodeURIComponent(b[d]));
            f.push("&")
        }
        d = f.join("");
        var c = a.join("");
        if (x()) {
            setTimeout(function () {
                window.location = c
            }, 25);
            window.location = d
        } else window.open(c, "pin" + (new Date).getTime(), "status=no,resizable=no,scrollbars=yes,personalbar=no,directories=no,location=no,toolbar=no,menubar=no,width=632,height=270,left=0,top=0")
    }
    function B(a) {
        if (Math.max(a.h, a.w) > 199) {
            if (a.h < a.w) return "margin-top: " + parseInt(100 - 100 * (a.h / a.w)) + "px;";
            return ""
        } else return "margin-top: " + parseInt(100 - a.h / 2) + "px;"
    }
    var q = [];
    if (!document.tpmLjs) {
        document.tpmLjs = 1;
        var i = document.getElementsByTagName("meta");
        for (var g in i) {
            var e = i[g];
            if (e.name && e.name.toUpperCase() == "PINTEREST" && e.content && e.content.toUpperCase() == "NOPIN") {
                window.alert("This site doesn't allow pinning to Pinterest. Please contact the owner with any questions. Thanks for visiting!");
                return
            }
        }
        i = /^https?:\/\/.*?\.?facebook\.com\//;
        e = /^https?:\/\/.*?\.?google\.com\/reader\//;
        if (location.href.match(/^http?:\/\/.*?\.?localhost\.com\//)) window.alert("The bookmarklet is installed! Now you can click your Pin It button to pin images as you browse sites around the web.");
        else if (location.href.match(i)) window.alert("The bookmarklet can't pin images directly from Facebook. Sorry about that.");
        else if (location.href.match(e)) window.alert("The bookmarklet can't pin images directly from Google Reader. Sorry about that.");
        else {
          


              var z = baseUrl+"/extractor/getSaveImage",
              A = getBaseURL()+"pinterest-clone/con_home/viewpin/447",


                r = null;
            if (t().length > 0) r = t();
            var n = function () {
                    function a(h) {
                        var j = new Image;
                        j.height = 360;
                        j.width = 480;
                        j.src = "http://img.youtube.com/vi/" + h + "/0.jpg";
                        return f(j, "video")
                    }
                    function b(h) {
                        if (h.src && h.src != "") {
                            var j = h.src.indexOf("?") > -1 ? "&" : "?";
                            h.src += j + "autoplay=0";
                            h.src += "&wmode=transparent"
                        }
                        h.setAttribute("wmode", "transparent");
                        j = h.parentNode;
                        var s = h.nextSibling;
                        j.removeChild(h);
                        j.insertBefore(h, s)
                    }
                    for (var d = [], f = function (h, j) {
                            j = j || "image";
                            var s = h.height,
                                C = h.width,
                                u = h.src,
                                v = new Image;
                            v.src = u;
                            return {
                                w: C,
                                h: s,
                                src: u,
                                img: h,
                                alt: "alt",
                                im2: v,
                                type: j
                            }
                        }, c = document.getElementsByTagName("iframe"), k = 0; k < c.length; k++) {
                        var l = /^http:\/\/www\.youtube\.com\/embed\/([a-zA-Z0-9\-_]+)/;
                        if (l = l.exec(c[k].src)) {
                            d.push(a(l[1]));
                            b(c[k])
                        }
                    }
                    c = document.getElementsByTagName("embed");
                    for (k = 0; k < c.length; k++) {
                        l = /^http:\/\/www\.youtube\.com\/v\/([a-zA-Z0-9\-_]+)/;
                        if (l = l.exec(c[k].src)) {
                            d.push(a(l[1]));
                            b(c[k])
                        }
                    }
                    l = /^http:\/\/www\.youtube\.com\/watch\?.*v=([a-zA-Z0-9\-_]+)/;
                    if (l = l.exec(window.location.href)) {
                        d.push(a(l[1]));
                        b(document.getElementById("movie_player"))
                    }
                    for (k = 0; k < document.images.length; k++) {
                        c = document.images[k];
                        if (c.style.display != "none") {
                            c = f(c);
                            if (c.w > 80 && c.h > 80 && (c.h > 109 || c.w > 109)) d.push(c)
                        }
                    }
                    return d
                }();
            if (n.length == 0) {
                window.alert("Sorry, we can't see any big images or videos on this page.");
                document.tpmLjs = 0
            } else {
                i = function () {
                    p.parentNode.removeChild(p);
                    o.parentNode.removeChild(o);
                    document.tpmLjs = 0;
                    if (m()) for (var a = 0; a < q.length; a++) q[a].parent.insertBefore(q[a].player, q[a].sibling);
                    return false
                };
                html = "<style>\n#tpm_Container {font-family: 'helvetica neue', arial, sans-serif; position: absolute; padding-top: 37px; z-index: 100000002; top: 0; left: 0; background-color: transparent; opacity: 1;}\n#tpm_Overlay {position: fixed; z-index: 9999; top: 0; right: 0; bottom: 0; left: 0; background-color: #f2f2f2; opacity: .95;}\n#tpm_Control {position:relative; z-index: 100000; float: left; background-color: #fcf9f9; border: solid #ccc; border-width: 0 1px 1px 0; height: 200px; width: 200px; opacity: 1;}\n#tpm_Control img {position: relative; padding: 0; display: block; margin: 29px auto 0; -ms-interpolation-mode: bicubic;}\n#tpm_Control a {position: fixed; z-index: 10001; right: 0; top: 0; left: 0; height: 24px; padding: 12px 0 0; text-align: center; font-size: 14px; line-height: 1em; text-shadow: 0 1px #fff; color: #211922; font-weight: bold; text-decoration: none; background: #fff url(http://d3io1k5o0zdpqr.cloudfront.net/images/fullGradient07Normal.png) 0 0 repeat-x; border-bottom: 1px solid #ccc; -mox-box-shadow: 0 0 2px #d7d7d7; -webkit-box-shadow: 0 0 2px #d7d7d7;}\n#tpm_Control a:hover {color: #fff; text-decoration: none; background-color: #1389e5; border-color: #1389e5; text-shadow: 0 -1px #46A0E6;}\n#tpm_Control a:active {height: 23px; padding-top: 13px; background-color: #211922; border-color: #211922; background-image: url(http://d3io1k5o0zdpqr.cloudfront.net/images/fullGradient07Inverted.png); text-shadow: 0 -1px #211922;}\n.tpmImagePreview {position: relative; padding: 0; margin: 0; float: left; background-color: #fff; border: solid #e7e7e7; border-width: 0 1px 1px 0; height: 200px; width: 200px; opacity: 1; z-index: 10002; text-align: center;}\n.tpmImagePreview .tpmImg {border: none; height: 200px; width: 200px; opacity: 1; padding: 0;}\n.tpmImagePreview .tpmImg a {margin: 0; padding: 0; position: absolute; top: 0; bottom: 0; right: 0; left: 0; display: block; text-align: center;  z-index: 1;}\n.tpmImagePreview .tpmImg a:hover {background-color: #fcf9f9; border: none;}\n.tpmImagePreview .tpmImg .ImageToPin {max-height: 200px; max-width: 200px; width: auto !important; height: auto !important;}\n.tpmImagePreview img.tpm_PinIt {border: none; position: absolute; top: 82px; left: 42px; display: none; padding: 0; background-color: transparent; z-index: 100;}\n.tpmImagePreview img.tpm_vidind {border: none; position: absolute; top: 75px; left: 75px; padding: 0; background-color: transparent; z-index: 99;}\n.tpmDimensions { position: relative; margin-top: 180px; text-align: center; font-size: 10px; z-index:10003; display: inline-block; background: white; border-radius: 4px; padding: 0 2px;}\n\n</style>";
                if (m()) {
                    e = document.createElement("style");
                    e.type = "text/css";
                    e.media = "screen";
                    e.styleSheet.cssText = "#tpm_Container {font-family: 'helvetica neue', arial, sans-serif; position: absolute; padding-top: 37px; z-index: 100000002; top: 0; left: 0; background-color: transparent; opacity: 1;}\n#tpm_Overlay {position: fixed; z-index: 9999; top: 0; right: 0; bottom: 0; left: 0; background-color: #f2f2f2; opacity: .95;}\n#tpm_Control {position:relative; z-index: 100000; float: left; background-color: #fcf9f9; border: solid #ccc; border-width: 0 1px 1px 0; height: 200px; width: 200px; opacity: 1;}\n#tpm_Control img {position: relative; padding: 0; display: block; margin: 29px auto 0; -ms-interpolation-mode: bicubic;}\n#tpm_Control a {position: fixed; z-index: 10001; right: 0; top: 0; left: 0; height: 24px; padding: 12px 0 0; text-align: center; font-size: 14px; line-height: 1em; text-shadow: 0 1px #fff; color: #211922; font-weight: bold; text-decoration: none; background: #fff url(http://d3io1k5o0zdpqr.cloudfront.net/images/fullGradient07Normal.png) 0 0 repeat-x; border-bottom: 1px solid #ccc; -mox-box-shadow: 0 0 2px #d7d7d7; -webkit-box-shadow: 0 0 2px #d7d7d7;}\n#tpm_Control a:hover {color: #fff; text-decoration: none; background-color: #1389e5; border-color: #1389e5; text-shadow: 0 -1px #46A0E6;}\n#tpm_Control a:active {height: 23px; padding-top: 13px; background-color: #211922; border-color: #211922; background-image: url(http://d3io1k5o0zdpqr.cloudfront.net/images/fullGradient07Inverted.png); text-shadow: 0 -1px #211922;}\n.tpmImagePreview {position: relative; padding: 0; margin: 0; float: left; background-color: #fff; border: solid #e7e7e7; border-width: 0 1px 1px 0; height: 200px; width: 200px; opacity: 1; z-index: 10002; text-align: center;}\n.tpmImagePreview .tpmImg {border: none; height: 200px; width: 200px; opacity: 1; padding: 0;}\n.tpmImagePreview .tpmImg a {margin: 0; padding: 0; position: absolute; top: 0; bottom: 0; right: 0; left: 0; display: block; text-align: center;  z-index: 1;}\n.tpmImagePreview .tpmImg a:hover {background-color: #fcf9f9; border: none;}\n.tpmImagePreview .tpmImg .ImageToPin {max-height: 200px; max-width: 200px; width: auto !important; height: auto !important;}\n.tpmImagePreview img.tpm_PinIt {border: none; position: absolute; top: 82px; left: 42px; display: none; padding: 0; background-color: transparent; z-index: 100;}\n.tpmImagePreview img.tpm_vidind {border: none; position: absolute; top: 75px; left: 75px; padding: 0; background-color: transparent; z-index: 99;}\n.tpmDimensions { position: relative; margin-top: 180px; text-align: center; font-size: 10px; z-index:10003; display: inline-block; background: white; border-radius: 4px; padding: 0 2px;}\n";
                    document.getElementsByTagName("head")[0].appendChild(e)
                } else {
                    if (navigator.userAgent.lastIndexOf("Safari/") > 0 && parseInt(navigator.userAgent.substr(navigator.userAgent.lastIndexOf("Safari/") + 7, 7)) < 533) {
                        e = document.createElement("style");
                        e.innerText = "\n#tpm_Container {font-family: 'helvetica neue', arial, sans-serif; position: absolute; padding-top: 37px; z-index: 100000002; top: 0; left: 0; background-color: transparent; opacity: 1;}\n#tpm_Overlay {position: fixed; z-index: 9999; top: 0; right: 0; bottom: 0; left: 0; background-color: #f2f2f2; opacity: .95;}\n#tpm_Control {position:relative; z-index: 100000; float: left; background-color: #fcf9f9; border: solid #ccc; border-width: 0 1px 1px 0; height: 200px; width: 200px; opacity: 1;}\n#tpm_Control img {position: relative; padding: 0; display: block; margin: 29px auto 0; -ms-interpolation-mode: bicubic;}\n#tpm_Control a {position: fixed; z-index: 10001; right: 0; top: 0; left: 0; height: 24px; padding: 12px 0 0; text-align: center; font-size: 14px; line-height: 1em; text-shadow: 0 1px #fff; color: #211922; font-weight: bold; text-decoration: none; background: #fff url(http://d3io1k5o0zdpqr.cloudfront.net/images/fullGradient07Normal.png) 0 0 repeat-x; border-bottom: 1px solid #ccc; -mox-box-shadow: 0 0 2px #d7d7d7; -webkit-box-shadow: 0 0 2px #d7d7d7;}\n#tpm_Control a:hover {color: #fff; text-decoration: none; background-color: #1389e5; border-color: #1389e5; text-shadow: 0 -1px #46A0E6;}\n#tpm_Control a:active {height: 23px; padding-top: 13px; background-color: #211922; border-color: #211922; background-image: url(http://d3io1k5o0zdpqr.cloudfront.net/images/fullGradient07Inverted.png); text-shadow: 0 -1px #211922;}\n.tpmImagePreview {position: relative; padding: 0; margin: 0; float: left; background-color: #fff; border: solid #e7e7e7; border-width: 0 1px 1px 0; height: 200px; width: 200px; opacity: 1; z-index: 10002; text-align: center;}\n.tpmImagePreview .tpmImg {border: none; height: 200px; width: 200px; opacity: 1; padding: 0;}\n.tpmImagePreview .tpmImg a {margin: 0; padding: 0; position: absolute; top: 0; bottom: 0; right: 0; left: 0; display: block; text-align: center;  z-index: 1;}\n.tpmImagePreview .tpmImg a:hover {background-color: #fcf9f9; border: none;}\n.tpmImagePreview .tpmImg .ImageToPin {max-height: 200px; max-width: 200px; width: auto !important; height: auto !important;}\n.tpmImagePreview img.tpm_PinIt {border: none; position: absolute; top: 82px; left: 42px; display: none; padding: 0; background-color: transparent; z-index: 100;}\n.tpmImagePreview img.tpm_vidind {border: none; position: absolute; top: 75px; left: 75px; padding: 0; background-color: transparent; z-index: 99;}\n.tpmDimensions { position: relative; margin-top: 180px; text-align: center; font-size: 10px; z-index:10003; display: inline-block; background: white; border-radius: 4px; padding: 0 2px;}\n\n"
                    } else {
                        e = document.createElement("style");
                        e.innerHTML = "\n#tpm_Container {font-family: 'helvetica neue', arial, sans-serif; position: absolute; padding-top: 37px; z-index: 100000002; top: 0; left: 0; background-color: transparent; opacity: 1;}\n#tpm_Overlay {position: fixed; z-index: 9999; top: 0; right: 0; bottom: 0; left: 0; background-color: #f2f2f2; opacity: .95;}\n#tpm_Control {position:relative; z-index: 100000; float: left; background-color: #fcf9f9; border: solid #ccc; border-width: 0 1px 1px 0; height: 200px; width: 200px; opacity: 1;}\n#tpm_Control img {position: relative; padding: 0; display: block; margin: 29px auto 0; -ms-interpolation-mode: bicubic;}\n#tpm_Control a {position: fixed; z-index: 10001; right: 0; top: 0; left: 0; height: 24px; padding: 12px 0 0; text-align: center; font-size: 14px; line-height: 1em; text-shadow: 0 1px #fff; color: #211922; font-weight: bold; text-decoration: none; background: #fff url(http://d3io1k5o0zdpqr.cloudfront.net/images/fullGradient07Normal.png) 0 0 repeat-x; border-bottom: 1px solid #ccc; -mox-box-shadow: 0 0 2px #d7d7d7; -webkit-box-shadow: 0 0 2px #d7d7d7;}\n#tpm_Control a:hover {color: #fff; text-decoration: none; background-color: #1389e5; border-color: #1389e5; text-shadow: 0 -1px #46A0E6;}\n#tpm_Control a:active {height: 23px; padding-top: 13px; background-color: #211922; border-color: #211922; background-image: url(http://d3io1k5o0zdpqr.cloudfront.net/images/fullGradient07Inverted.png); text-shadow: 0 -1px #211922;}\n.tpmImagePreview {position: relative; padding: 0; margin: 0; float: left; background-color: #fff; border: solid #e7e7e7; border-width: 0 1px 1px 0; height: 200px; width: 200px; opacity: 1; z-index: 10002; text-align: center;}\n.tpmImagePreview .tpmImg {border: none; height: 200px; width: 200px; opacity: 1; padding: 0;}\n.tpmImagePreview .tpmImg a {margin: 0; padding: 0; position: absolute; top: 0; bottom: 0; right: 0; left: 0; display: block; text-align: center;  z-index: 1;}\n.tpmImagePreview .tpmImg a:hover {background-color: #fcf9f9; border: none;}\n.tpmImagePreview .tpmImg .ImageToPin {max-height: 200px; max-width: 200px; width: auto !important; height: auto !important;}\n.tpmImagePreview img.tpm_PinIt {border: none; position: absolute; top: 82px; left: 42px; display: none; padding: 0; background-color: transparent; z-index: 100;}\n.tpmImagePreview img.tpm_vidind {border: none; position: absolute; top: 75px; left: 75px; padding: 0; background-color: transparent; z-index: 99;}\n.tpmDimensions { position: relative; margin-top: 180px; text-align: center; font-size: 10px; z-index:10003; display: inline-block; background: white; border-radius: 4px; padding: 0 2px;}\n\n"
                    }
                    document.body.appendChild(e)
                }
                var p = document.createElement("div");
                p.setAttribute("id", "tpm_Overlay");
                document.keydown = i;
                document.body.appendChild(p);
                var o = document.createElement("div");
                o.setAttribute("id", "tpm_Container");
                document.body.appendChild(o);
                e = document.createElement("div");
                e.setAttribute("id", "tpm_Control");
                t_img = new Image;
//                t_img.src = "http://staging.cubettech.com/ci/pinterest/application/assets/images/full/logo.jpg";
                t_img.src = baseUrl+"/application/assets/images/full/logo.jpg";
                
                e.appendChild(t_img);
                t_a = document.createElement("a");
                t_a.href = "#";
                t_a.id = "tpm_RemoveLink";
                t_a.appendChild(document.createTextNode("Cancel Pin"));
                e.appendChild(t_a);
                o.appendChild(e);
                document.getElementById("tpm_RemoveLink").onclick = i;
                i = {};
                for (g = 0; g < n.length; g++) if (!(i[n[g].src] || n[g].im2.height && n[g].im2.height < 80)) {
                    i[n[g].src] = 1;
                    (function (a) {
                        var b = document.createElement("div");
                        if (m()) b.className = "tpmImagePreview";
                        else b.setAttribute("class", "tpmImagePreview");
                        var d = document.createElement("div");
                        if (m()) d.className = "tpmImg";
                        else d.setAttribute("class", "tpmImg");
                        var f = document.createElement("span");
                        f.innerHTML = a.w + " x " + a.h;
                        if (m()) f.className = "tpmDimensions";
                        else f.setAttribute("class", "tpmDimensions");
                        b.appendChild(f);
                        document.getElementById("tpm_Container").appendChild(b).appendChild(d);
                        b = document.createElement("a");
                        b.setAttribute("href", "#");
                        b.onclick = function () {
                            y(a);
                            p.parentNode.removeChild(p);
                            o.parentNode.removeChild(o);
                            document.tpmLjs = 0;
                            return false
                        };
                        d.appendChild(b);
                        f = document.createElement("img");
                        if (m()) d.className = "tpmImg";
                        else d.setAttribute("class", "tpmImg");
                        f.setAttribute("style", "" + B(a));
                        f.src = a.src;
                        f.setAttribute("alt", "Pin This");
                        f.className = "ImageToPin";
                        b.appendChild(f);
                        var c = document.createElement("img");
                        if (m()) c.className = "tpm_PinIt";
                        else c.setAttribute("class", "tpm_PinIt");
//                        c.src = "http://staging.cubettech.com/ci/pinterest/application/assets/images/pinthis.png";
                        c.src = baseUrl+"/application/assets/images/pinthis.png";
                        c.setAttribute("alt", "Pin This");
                        if (m()) {
                            b.attachEvent("onmouseover", function () {
                                c.style.display = "block"
                            });
                            b.attachEvent("onmouseout", function () {
                                c.style.display = "none"
                            })
                        } else {
                            b.addEventListener("mouseover", function () {
                                c.style.display = "block"
                            }, false);
                            b.addEventListener("mouseout", function () {
                                c.style.display = "none"
                            }, false)
                        }
                        b.appendChild(c);
                        if (n[g].type == "video") {
                            d = document.createElement("img");
                            if (m()) d.className = "tpm_vidind";
                            else d.setAttribute("class", "tpm_vidind");
//                            d.src = "http://staging.cubettech.com/ci/pinterest/application/assets/images/video.png";
                            d.src = baseUrl+"/application/assets/images/video.png";
                            b.appendChild(d)
                        }
                    })(n[g])
                }
                if (m()) {
                    i = document.getElementsByTagName("object");
                    for (g = 0; g < i.length; g++) {
                        e = {
                            player: i[g],
                            parent: i[g].parentNode,
                            sibling: i[g].nextSibling
                        };
                        e.parent.removeChild(i[g]);
                        q.push(e)
                    }
                }
                scroll(0, 0);
                return n

            }
        }
    }
})();