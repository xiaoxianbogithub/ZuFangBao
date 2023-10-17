import request from '@/utils/request'

// 查询房源收藏列表
export function listFavorite(query) {
  return request({
    url: '/residence/favorite/list',
    method: 'get',
    params: query
  })
}

// 查询房源收藏详细
export function getFavorite(id) {
  return request({
    url: '/residence/favorite/' + id,
    method: 'get'
  })
}

// 新增房源收藏
export function addFavorite(data) {
  return request({
    url: '/residence/favorite',
    method: 'post',
    data: data
  })
}

// 修改房源收藏
export function updateFavorite(data) {
  return request({
    url: '/residence/favorite',
    method: 'put',
    data: data
  })
}

// 删除房源收藏
export function delFavorite(id) {
  return request({
    url: '/residence/favorite/' + id,
    method: 'delete'
  })
}
