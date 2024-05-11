const ERRORCODE = {
  USER: "100001", // 错误码
  AUTH: "100002",
  TAG: "100003",
  CATEGORY: "100004",
  ARTICLE: "100005",
  UPLOAD: "100006",
  CONFIG: "100007",
}

/**
 * 公共返回结果方法
 * @param {*} message 提示信息
 * @param {*} result 结果
 * @returns
 */
function result(message, result) {
  return {
    code: 0,
    message,
    result,
  }
}

/**
 * 公共抛出错误方法
 * @param {*} code 错误码
 * @param {*} message 错误信息
 * @returns
 */
function throwError(code, message) {
  return {
    code,
    message,
  }
}

module.exports = {
  ERRORCODE,
  result,
  throwError,
}
