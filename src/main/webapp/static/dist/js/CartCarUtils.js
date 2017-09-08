/**
 *    基于jQuery Cookie实现购物车分析工具类
 * 用于商城基本数据的统计
 */

//购物车对象
var Cart = function () {
    this.Count = 0,
        this.Total = 0,
        this.Items = new Array();
}

//购物车集合对象
var CartItem = function () {
    this.Id = 0,
        this.Name = "",
        this.Count = 0,
        this.Price = 0
}
//购物车操作
var CartHelper = function () {
    //向购物车添加数据
    this.cookieName = "yxhCart";
    this.Clear = function () {
        var cart = new Cart();
        this.Save(cart);
        return cart;
    }
    //向购物车添加
    this.Add = function (id, name, count, price) {
        var car
        t = this.Read();
        var index = this.find();
    }
    //改变数量
    //移出购物车
    //根据ID查找
    //COOKIE操作
    //读取COOKIE中的集合
}
