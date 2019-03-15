---
title: 摄影 or 视频
noDate: true
type: "photos"
comments: false
---
<link rel="stylesheet" href="./ins.css">
<link rel="stylesheet" href="./photoswipe.css">
<link rel="stylesheet" href="./default-skin/default-skin.css">
<div class="photos-btn-wrap">
	<a class="photos-btn active" href="javascript:void(0)">Photos</a>
	<a class="photos-btn" href="/photos/videos.html">Videos</a>
</div>
<div class="instagram itemscope">
	<a href="https://wugenqiang.github.io" target="_blank" class="open-ins">图片正在加载中…</a>
</div>
<script>
  (function() {
    var loadScript = function(path) {
      var $script = document.createElement('script')
      document.getElementsByTagName('body')[0].appendChild($script)
      $script.setAttribute('src', path)
    }
    setTimeout(function() {
      loadScript('./ins.js')
    }, 0)
  })()
</script>
