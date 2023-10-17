import request from '@/utils/request'

// 查询房源配置列表
export function listFacility(query) {
  return request({
    url: '/residence/facility/list',
    method: 'get',
    params: query
  })
}

// 查询房源配置详细
export function getFacility(id) {
  return request({
    url: '/residence/facility/' + id,
    method: 'get'
  })
}

// 新增房源配置
export function addFacility(data) {
  return request({
    url: '/residence/facility',
    method: 'post',
    data: data
  })
}

// 修改房源配置
export function updateFacility(data) {
  return request({
    url: '/residence/facility',
    method: 'put',
    data: data
  })
}

// 删除房源配置
export function delFacility(id) {
  return request({
    url: '/residence/facility/' + id,
    method: 'delete'
  })
}
