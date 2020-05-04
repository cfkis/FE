/**
 * 防抖实现
 * n秒后执行一次
 * 应用场景：连续的事件响应，我们只触发一次回调
 * 如：resize、onscroll;input validate
 * @param {*} func 
 * @param {*} time 
 * @param {*} immediate 
 */
const debounce = (func, time, immediate) => {
  
  let timer, content, args

  // 延迟执行函数
  // time后清除timer,如果需要立即执行一次则会先执行一次
  const later = () => setTimeout(() => {
    timer = null
    if (!immediate) {
      func.apply(content, args)
      content = args = null
    }
  }, time)

  return function(...params) {
    if (timer) {
      // 如果在time内触发，此时timer存在，则清除本次timer
      clearTimeout(timer)
      // 生成新的延迟执行
      timer = later()
    }else {
      // 生成新的延迟执行
      timer = later()
      if (immediate) {
        func(this, params)
      }else {
        content = this
        args = params
      }
    }
  }

}

/**
 * throttle 
 * 节流函数，间隔固定时间段执行
 * @param {*} func 
 * @param {*} time 
 */
const throttle = (func, time) => {

  let lastTime = 0
  time = +time || 0
  return function() {
    const nowTime = + new Date()
    if (nowTime - lastTime > time || !lastTime) {
      func()
      lastTime = time
    }
  }
}

