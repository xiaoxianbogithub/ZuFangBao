import request from '@/utils/request'

// 查询房源品牌列表
export function listBrand(query) {
  return request({
    url: '/residence/brand/list',
    method: 'get',
    params: query
  })
}

// 查询房源品牌详细
export function getBrand(id) {
  return request({
    url: '/residence/brand/' + id,
    method: 'get'
  })
}

// 新增房源品牌
export function addBrand(data) {
  return request({
    url: '/residence/brand',
    method: 'post',
    data: data
  })
}

// 修改房源品牌
export function updateBrand(data) {
  return request({
    url: '/residence/brand',
    method: 'put',
    data: data
  })
}

// 删除房源品牌
export function delBrand(id) {
  return request({
    url: '/residence/brand/' + id,
    method: 'delete'
  })
}
