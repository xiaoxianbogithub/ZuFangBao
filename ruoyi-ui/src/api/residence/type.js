import request from '@/utils/request'

// 查询房源户型设定列表
export function listType(query) {
  return request({
    url: '/residence/type/list',
    method: 'get',
    params: query
  })
}

// 查询房源户型设定详细
export function getType(id) {
  return request({
    url: '/residence/type/' + id,
    method: 'get'
  })
}

// 新增房源户型设定
export function addType(data) {
  return request({
    url: '/residence/type',
    method: 'post',
    data: data
  })
}

// 修改房源户型设定
export function updateType(data) {
  return request({
    url: '/residence/type',
    method: 'put',
    data: data
  })
}

// 删除房源户型设定
export function delType(id) {
  return request({
    url: '/residence/type/' + id,
    method: 'delete'
  })
}
