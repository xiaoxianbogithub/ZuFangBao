import request from '@/utils/request'

// 查询房源押金设置列表
export function listDeposit(query) {
  return request({
    url: '/residence/deposit/list',
    method: 'get',
    params: query
  })
}

// 查询房源押金设置详细
export function getDeposit(id) {
  return request({
    url: '/residence/deposit/' + id,
    method: 'get'
  })
}

// 新增房源押金设置
export function addDeposit(data) {
  return request({
    url: '/residence/deposit',
    method: 'post',
    data: data
  })
}

// 修改房源押金设置
export function updateDeposit(data) {
  return request({
    url: '/residence/deposit',
    method: 'put',
    data: data
  })
}

// 删除房源押金设置
export function delDeposit(id) {
  return request({
    url: '/residence/deposit/' + id,
    method: 'delete'
  })
}
