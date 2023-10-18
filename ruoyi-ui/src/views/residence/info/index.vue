<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="价格" prop="price">
        <el-input
          v-model="queryParams.price"
          placeholder="请输入价格"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="水费" prop="waterBill">
        <el-input
          v-model="queryParams.waterBill"
          placeholder="请输入水费"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="电费" prop="electricityBill">
        <el-input
          v-model="queryParams.electricityBill"
          placeholder="请输入电费"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="面积" prop="square">
        <el-input
          v-model="queryParams.square"
          placeholder="请输入面积"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="楼层" prop="floor">
        <el-input
          v-model="queryParams.floor"
          placeholder="请输入楼层"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="房源位置id" prop="addressId">
        <el-input
          v-model="queryParams.addressId"
          placeholder="请输入房源位置id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间">
        <el-date-picker
          v-model="daterangeCreateTime"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['residence:info:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['residence:info:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['residence:info:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['residence:info:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="infoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="房源分类id" align="center" prop="categoryId" />
      <el-table-column label="房源品牌id" align="center" prop="brandId" />
      <el-table-column label="价格" align="center" prop="price" />
      <el-table-column label="押金设置id" align="center" prop="depositId" />
      <el-table-column label="付款设置id" align="center" prop="payId" />
      <el-table-column label="水费" align="center" prop="waterBill" />
      <el-table-column label="电费" align="center" prop="electricityBill" />
      <el-table-column label="户型设定id" align="center" prop="houseTypeId" />
      <el-table-column label="面积" align="center" prop="square" />
      <el-table-column label="楼层" align="center" prop="floor" />
      <el-table-column label="是否有电梯" align="center" prop="elevator" />
      <el-table-column label="装修" align="center" prop="furnish" />
      <el-table-column label="房源简介" align="center" prop="introduction" />
      <el-table-column label="房源位置id" align="center" prop="addressId" />
      <el-table-column label="详细地址" align="center" prop="addressDetail" />
      <el-table-column label="房源配置JSON(属性数组，JSON 格式, e.g.[{propertId: , valueId: }, {propertId: , valueId: }]) " align="center" prop="facilities" />
      <el-table-column label="房源标签JSON" align="center" prop="labels" />
      <el-table-column label="收藏量" align="center" prop="favoriteCount" />
      <el-table-column label="浏览量" align="center" prop="browseCount" />
      <el-table-column label="状态" align="center" prop="status" />
      <el-table-column label="排序" align="center" prop="sort" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['residence:info:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['residence:info:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改房屋基本信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="价格" prop="price">
          <el-input v-model="form.price" placeholder="请输入价格" />
        </el-form-item>
        <el-form-item label="水费" prop="waterBill">
          <el-input v-model="form.waterBill" placeholder="请输入水费" />
        </el-form-item>
        <el-form-item label="电费" prop="electricityBill">
          <el-input v-model="form.electricityBill" placeholder="请输入电费" />
        </el-form-item>
        <el-form-item label="面积" prop="square">
          <el-input v-model="form.square" placeholder="请输入面积" />
        </el-form-item>
        <el-form-item label="楼层" prop="floor">
          <el-input v-model="form.floor" placeholder="请输入楼层" />
        </el-form-item>
        <el-form-item label="房源简介" prop="introduction">
          <el-input v-model="form.introduction" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="房源位置id" prop="addressId">
          <el-input v-model="form.addressId" placeholder="请输入房源位置id" />
        </el-form-item>
        <el-form-item label="详细地址" prop="addressDetail">
          <el-input v-model="form.addressDetail" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="收藏量" prop="favoriteCount">
          <el-input v-model="form.favoriteCount" placeholder="请输入收藏量" />
        </el-form-item>
        <el-form-item label="浏览量" prop="browseCount">
          <el-input v-model="form.browseCount" placeholder="请输入浏览量" />
        </el-form-item>
        <el-form-item label="排序" prop="sort">
          <el-input v-model="form.sort" placeholder="请输入排序" />
        </el-form-item>
        <el-divider content-position="center">房源图片信息</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddResidencePicture">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteResidencePicture">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="residencePictureList" :row-class-name="rowResidencePictureIndex" @selection-change="handleResidencePictureSelectionChange" ref="residencePicture">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="排序" prop="sort" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.sort" placeholder="请输入排序" />
            </template>
          </el-table-column>
        </el-table>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listInfo, getInfo, delInfo, addInfo, updateInfo } from "@/api/residence/info";

export default {
  name: "Info",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedResidencePicture: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 房屋基本信息表格数据
      infoList: [],
      // 房源图片表格数据
      residencePictureList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 排序时间范围
      daterangeCreateTime: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        categoryId: null,
        brandId: null,
        price: null,
        waterBill: null,
        electricityBill: null,
        houseTypeId: null,
        square: null,
        floor: null,
        elevator: null,
        furnish: null,
        addressId: null,
        addressDetail: null,
        status: null,
        createTime: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询房屋基本信息列表 */
    getList() {
      this.loading = true;
      this.queryParams.params = {};
      if (null != this.daterangeCreateTime && '' != this.daterangeCreateTime) {
        this.queryParams.params["beginCreateTime"] = this.daterangeCreateTime[0];
        this.queryParams.params["endCreateTime"] = this.daterangeCreateTime[1];
      }
      listInfo(this.queryParams).then(response => {
        this.infoList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        categoryId: null,
        brandId: null,
        price: null,
        depositId: null,
        payId: null,
        depositeAmount: null,
        payAmount: null,
        totalAmount: null,
        waterBill: null,
        electricityBill: null,
        houseTypeId: null,
        square: null,
        floor: null,
        elevator: null,
        furnish: null,
        introduction: null,
        addressId: null,
        addressDetail: null,
        facilities: null,
        labels: null,
        favoriteCount: null,
        browseCount: null,
        status: null,
        deleted: null,
        weights: null,
        sort: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
      };
      this.residencePictureList = [];
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.daterangeCreateTime = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加房屋基本信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getInfo(id).then(response => {
        this.form = response.data;
        this.residencePictureList = response.data.residencePictureList;
        this.open = true;
        this.title = "修改房屋基本信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.residencePictureList = this.residencePictureList;
          if (this.form.id != null) {
            updateInfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addInfo(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除房屋基本信息编号为"' + ids + '"的数据项？').then(function() {
        return delInfo(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
	/** 房源图片序号 */
    rowResidencePictureIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 房源图片添加按钮操作 */
    handleAddResidencePicture() {
      let obj = {};
      obj.sort = "";
      this.residencePictureList.push(obj);
    },
    /** 房源图片删除按钮操作 */
    handleDeleteResidencePicture() {
      if (this.checkedResidencePicture.length == 0) {
        this.$modal.msgError("请先选择要删除的房源图片数据");
      } else {
        const residencePictureList = this.residencePictureList;
        const checkedResidencePicture = this.checkedResidencePicture;
        this.residencePictureList = residencePictureList.filter(function(item) {
          return checkedResidencePicture.indexOf(item.index) == -1
        });
      }
    },
    /** 复选框选中数据 */
    handleResidencePictureSelectionChange(selection) {
      this.checkedResidencePicture = selection.map(item => item.index)
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('residence/info/export', {
        ...this.queryParams
      }, `info_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
