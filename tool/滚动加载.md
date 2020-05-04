# CSS预处理在单文件组件中使用全局变量

> 1.插件 npm install sass-resources-loader --save-dev

> 2.rem.js + common.scss 使用来说明
```
// rem.js
(function(){
  var docEl = document.documentElement;
  function setRemUnit(){
    var rem = docEl.clientWidth / 10;
    docEl.style.fontSize = rem + 'px';
  }
  setRemUnit();
  window.addEventListener('resize', setRemUnit);
})();
````
```
````
// common.scss 

@function px2rem($px) {
  $rem: 37.5px;
  @return ($px / $rem) + rem;
}
````
如何使用这个 px2rem 不可能每个文件都去重复引入，所以需要将第一不安装的loader配置在webpack中 

为更便利的使用 px2rem 这个scss函数，vscode中可以安装px to rem 的插件，即可以通过快捷键快速操作之前写的px地方进行替换。
