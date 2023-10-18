import request from '@/utils/request'

// 查询房源品牌图片列表
export function listBrandPicture(query) {
  return request({
    url: '/residence/brandPicture/list',
    method: 'get',
    params: query
  })
}

// 查询房源品牌图片详细
export function getBrandPicture(id) {
  return request({
    url: '/residence/brandPicture/' + id,
    method: 'get'
  })
}

// 新增房源品牌图片
export function addBrandPicture(data) {
  return request({
    url: '/residence/brandPicture',
    method: 'post',
    data: data
  })
}

// 修改房源品牌图片
export function updateBrandPicture(data) {
  return request({
    url: '/residence/brandPicture',
    method: 'put',
    data: data
  })
}

// 删除房源品牌图片
export function delBrandPicture(id) {
  return request({
    url: '/residence/brandPicture/' + id,
    method: 'delete'
  })
}
