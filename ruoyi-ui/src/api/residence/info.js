import request from '@/utils/request'

// 查询房屋基本信息列表
export function listInfo(query) {
  return request({
    url: '/residence/info/list',
    method: 'get',
    params: query
  })
}

// 查询房屋基本信息详细
export function getInfo(id) {
  return request({
    url: '/residence/info/' + id,
    method: 'get'
  })
}

// 新增房屋基本信息
export function addInfo(data) {
  return request({
    url: '/residence/info',
    method: 'post',
    data: data
  })
}

// 修改房屋基本信息
export function updateInfo(data) {
  return request({
    url: '/residence/info',
    method: 'put',
    data: data
  })
}

// 删除房屋基本信息
export function delInfo(id) {
  return request({
    url: '/residence/info/' + id,
    method: 'delete'
  })
}
