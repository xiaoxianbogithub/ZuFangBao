import request from '@/utils/request'

// 查询房源品牌图片列表
export function listPicture(query) {
  return request({
    url: '/residence/picture/list',
    method: 'get',
    params: query
  })
}

// 查询房源品牌图片详细
export function getPicture(id) {
  return request({
    url: '/residence/picture/' + id,
    method: 'get'
  })
}

// 新增房源品牌图片
export function addPicture(data) {
  return request({
    url: '/residence/picture',
    method: 'post',
    data: data
  })
}

// 修改房源品牌图片
export function updatePicture(data) {
  return request({
    url: '/residence/picture',
    method: 'put',
    data: data
  })
}

// 删除房源品牌图片
export function delPicture(id) {
  return request({
    url: '/residence/picture/' + id,
    method: 'delete'
  })
}
