import request from '@/utils/request'

// 查询房源分类列表
export function listCategory(query) {
  return request({
    url: '/residence/category/list',
    method: 'get',
    params: query
  })
}

// 查询房源分类详细
export function getCategory(id) {
  return request({
    url: '/residence/category/' + id,
    method: 'get'
  })
}

// 新增房源分类
export function addCategory(data) {
  return request({
    url: '/residence/category',
    method: 'post',
    data: data
  })
}

// 修改房源分类
export function updateCategory(data) {
  return request({
    url: '/residence/category',
    method: 'put',
    data: data
  })
}

// 删除房源分类
export function delCategory(id) {
  return request({
    url: '/residence/category/' + id,
    method: 'delete'
  })
}
