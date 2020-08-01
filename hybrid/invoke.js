window.callbackId = 0

export default function(obj, callback) {

  // 要执行的方法
  const cmd = obj.cmd
  // json参数
  const data = obj.data

  // 回调函数设置
  if(callback) {
    const functionName = 'CALLBACK' + window.callbackId
    // 回调函数的名称要传给 native
    // callbackFuncname 次名称需要与 native 保持一致，
    // 即当 native 要回调 js时，知道要回调那个方法名
    data.callbackFuncname = functionName
    window[functionName] = callback
  }

  // 构造 iframe 发送请求
  const url = 'jsbridge://' + cmd + '?c=' + JSON.stringify(data)

  const iframe = document.createElement('iframe')
  iframe.src = url
  iframe.style.display = 'none'
  document.body.appendChild(iframe)
  setTimeout(() => {
    document.body.removeChild(iframe)
  }, 800)

  window.callbackId++

}