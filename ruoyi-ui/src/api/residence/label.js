import request from '@/utils/request'

// 查询房源标签列表
export function listLabel(query) {
  return request({
    url: '/residence/label/list',
    method: 'get',
    params: query
  })
}

// 查询房源标签详细
export function getLabel(id) {
  return request({
    url: '/residence/label/' + id,
    method: 'get'
  })
}

// 新增房源标签
export function addLabel(data) {
  return request({
    url: '/residence/label',
    method: 'post',
    data: data
  })
}

// 修改房源标签
export function updateLabel(data) {
  return request({
    url: '/residence/label',
    method: 'put',
    data: data
  })
}

// 删除房源标签
export function delLabel(id) {
  return request({
    url: '/residence/label/' + id,
    method: 'delete'
  })
}
