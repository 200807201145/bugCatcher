![bug](README/capture_bug.png)

# 捉虫记

@[|Spring|Sping MVC|Mybatis]

-------------------

[TOC]

## 捉虫记简介

**捉虫记** 设计初衷是为了方便开发人员自测，当然了，对于需要自行完成测试的测试团队也是适用的，主要特性：

- **项目管理** ：由需求方发起项目，并以 *瀑布流* 软件开发模型跟踪整个项目的完成情况；
- **用例管理** ：方便添加测试用例，也支持Excel、Xmind等用例文件上传，支持用例筛选，并为项目分配需要执行的用例；
- **项目质量图表** ：图表以时间线方式展示项目组各个项目的质量变化；
- **自测质量排名** ：以积分排名的方式展示项目成员自测质量高低；
- **精细化的权限控制** ：精细的角色分离（产品、开发、测试），提供精细化的权限控制，某角色可以做什么，不可以做什么一目了然；

### 典型使用场景
```flow
st=>start: Start
e=>end
op=>operation: 产品发起项目，指定项目开发人员
op1=>operation: 测试设计用例，将项目相关的用例与项目关联
op2=>operation: 开发人员执行用例
op3=>operation: 开发人员执行用例
op4=>operation: 测试检查用例执行情况，并给用例执行人评分
st->op->op1->op2->op3->op4->e
```


> **提示：**具体可参考下面`典型场景使用图示`一节，但是什么角色做什么不是绝对的，可以根据团队实际情况调整，比如，可以由测试发起项目，或者由测试人员执行用例等。



## 使用方法

### 需要的工具
**系统：**Linux
**语言：**Java （Version>1.8）
**数据库：**Mysql
**其他工具：**Maven

### 初始化
修改`setup`/jdbc


/Users/sunjun/spring/bugCatcher/src/main/resources/database/pfcase-schema.sql
/Users/sunjun/spring/bugCatcher/setup.sh
/Users/sunjun/spring/bugCatcher/src/main/resources/orm/jdbc.properties



执行`./setup.sh`

### 启动
mvn tomcat7:run -Dmaven.tomcat.port=<port no.> &
>**提示：**`<port no.>`设置为任意未被占用的端口即可

## 典型场景使用图示
### 新用户注册
<img src="README/new.jpeg" width="350">


#### `角色-功能对照表`
| 角色/功能 | 我的任务 | 执行用例 | 执行评价 | 新建任务 |  新建用例 | 查看用例 | 分配用例 | 上传用例 | 执行质量 | 华山论剑
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| 测试 | 展示所有人的任务 |  --  | - [x]   | - [x]   | - [x]   |  - [x]  | - [x]  | - [x]   |  - [x]  |    - [x]  |
| 开发 | 只展示自己的任务 |- [x] |   --    |   - [x] | - [x]   |   - [x] |  - [x] |  - [x]  |   - [x] |   --     |
| 产品 | 只展示自己的任务 |  --  |  --     |  - [x]  |  - [x]  |   - [x] |  --    |   - [x] |  - [x]  |   --     |
| admin | 展示所有人的任务 |- [x]| - [x]  |   - [x] |  - [x]  | - [x]   |  - [x]  | - [x]  | - [x]   | - [x]  |
>**admin：**内置账户，拥有最高权限，可以做任何操作，慎用。

### 产品发起项目，指定项目开发人员:
<img src="README/new_task.jpeg">

### 测试设计用例，将项目相关的用例与项目关联:
新建用例，模块支持新建或者选择已有的:
![Alt text](README/new_case.jpeg)

勾选该项目需要执行的用例并分配（用例支持按指定条件搜索/筛选）:
![Alt text](README/fenpei.jpeg)

也支持Excel、Xmind文件形式的用例上传，但仅做备份用例使用：
![Alt text](README/upload.jpeg)


### 开发人员执行用例
执行一条，已执行下勾选一条：
![Alt text](README/my.jpeg)

### 测试检查用例执行情况，并给执行人评分
测试人员一条条检查下去，功能无误点击good按钮，执行不到位点击bad按钮（可以将bug链接填写上去），当项目下的用例全部执行完以后会在项目概况下自动打分
![Alt text](README/pingfen.jpeg)

### 项目自测质量的打分会以图表的形式展现
![Alt text](README/pic.jpeg)

### 华山论剑
此栏目主要对执行用例的开发人员进行自测质量评价，评分有A（+20）/ B（+10）/ C（-10）三个等级，具体评价标准可以自己定义，最终会给所有人员一个积分排名
![Alt text](README/jian.jpeg)

## TODO
- bug管理与跟踪
- 。。。

## 反馈与建议
- 邮箱：<canyuns@163.com>
