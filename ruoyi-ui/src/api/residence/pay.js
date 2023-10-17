import request from '@/utils/request'

// 查询房源付款设置列表
export function listPay(query) {
  return request({
    url: '/residence/pay/list',
    method: 'get',
    params: query
  })
}

// 查询房源付款设置详细
export function getPay(id) {
  return request({
    url: '/residence/pay/' + id,
    method: 'get'
  })
}

// 新增房源付款设置
export function addPay(data) {
  return request({
    url: '/residence/pay',
    method: 'post',
    data: data
  })
}

// 修改房源付款设置
export function updatePay(data) {
  return request({
    url: '/residence/pay',
    method: 'put',
    data: data
  })
}

// 删除房源付款设置
export function delPay(id) {
  return request({
    url: '/residence/pay/' + id,
    method: 'delete'
  })
}
