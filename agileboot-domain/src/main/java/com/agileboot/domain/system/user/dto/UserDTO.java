package com.agileboot.domain.system.user.dto;

import cn.hutool.core.bean.BeanUtil;
import com.agileboot.common.annotation.ExcelColumn;
import com.agileboot.common.annotation.ExcelSheet;
import com.agileboot.domain.common.cache.CacheCenter;
import com.agileboot.domain.system.dept.db.SysDeptEntity;
import com.agileboot.domain.system.post.db.SysPostEntity;
import com.agileboot.domain.system.role.db.SysRoleEntity;
import com.agileboot.domain.system.user.db.SysUserEntity;
import com.agileboot.domain.system.user.db.SearchUserDO;
import java.util.Date;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * @author valarchie
 */
@ExcelSheet(name = "用户列表")
@Data
@NoArgsConstructor
@Slf4j
public class UserDTO {

    public UserDTO(SysUserEntity entity) {
        if (entity != null) {
            try {
                BeanUtil.copyProperties(entity, this);

                // 从缓存获取部门名称
                if (entity.getDeptId() != null) {
                    try {
                        SysDeptEntity dept = CacheCenter.deptCache.getObjectById(entity.getDeptId().toString());
                        if (dept != null) {
                            this.deptName = dept.getDeptName();
                        }
                    } catch (Exception e) {
                        log.error("获取部门信息失败: {}", e.getMessage());
                    }
                }

                // 从缓存获取创建者名称
                if (entity.getCreatorId() != null) {
                    try {
                        SysUserEntity creator = CacheCenter.userCache.getObjectById(entity.getCreatorId());
                        if (creator != null) {
                            this.creatorName = creator.getUsername();
                        }
                    } catch (Exception e) {
                        log.error("获取创建者信息失败: {}", e.getMessage());
                    }
                }

                // 从缓存获取角色名称
                if (entity.getRoleId() != null) {
                    try {
                        SysRoleEntity roleEntity = CacheCenter.roleCache.getObjectById(entity.getRoleId());
                        this.roleName = roleEntity != null ? roleEntity.getRoleName() : "";
                    } catch (Exception e) {
                        log.error("获取角色信息失败: {}", e.getMessage());
                        this.roleName = "";
                    }
                }

                // 从缓存获取职位名称
                if (entity.getPostId() != null) {
                    try {
                        SysPostEntity post = CacheCenter.postCache.getObjectById(entity.getPostId());
                        this.postName = post != null ? post.getPostName() : "";
                    } catch (Exception e) {
                        log.error("获取职位信息失败: {}", e.getMessage());
                        this.postName = "";
                    }
                }
            } catch (Exception e) {
                log.error("UserDTO构造函数异常: {}", e.getMessage());
            }
        }
    }

    public UserDTO(SearchUserDO entity) {
        if (entity != null) {
            try {
                BeanUtil.copyProperties(entity, this);

                if (entity.getRoleId() != null) {
                    try {
                        SysRoleEntity roleEntity = CacheCenter.roleCache.getObjectById(entity.getRoleId());
                        this.roleName = roleEntity != null ? roleEntity.getRoleName() : "";
                    } catch (Exception e) {
                        log.error("获取角色信息失败: {}", e.getMessage());
                        this.roleName = "";
                    }
                }
            } catch (Exception e) {
                log.error("UserDTO(SearchUserDO)构造函数异常: {}", e.getMessage());
            }
        }
    }


    @ExcelColumn(name = "用户ID")
    private Long userId;

    @ExcelColumn(name = "职位ID")
    private Long postId;

    @ExcelColumn(name = "职位名称")
    private String postName;

    @ExcelColumn(name = "角色ID")
    private Long roleId;

    @ExcelColumn(name = "角色名称")
    private String roleName;

    @ExcelColumn(name = "部门ID")
    private Long deptId;

    @ExcelColumn(name = "部门名称")
    private String deptName;

    @ExcelColumn(name = "用户名")
    private String username;

    @ExcelColumn(name = "用户昵称")
    private String nickname;

    @ExcelColumn(name = "用户类型")
    private Integer userType;

    @ExcelColumn(name = "邮件")
    private String email;

    @ExcelColumn(name = "号码")
    private String phoneNumber;

    @ExcelColumn(name = "性别")
    private Integer sex;

    @ExcelColumn(name = "用户头像")
    private String avatar;

    @ExcelColumn(name = "状态")
    private Integer status;

    @ExcelColumn(name = "IP")
    private String loginIp;

    @ExcelColumn(name = "登录时间")
    private Date loginDate;

    @ExcelColumn(name = "创建者ID")
    private Long creatorId;

    @ExcelColumn(name = "创建者")
    private String creatorName;

    @ExcelColumn(name = "创建时间")
    private Date createTime;

    @ExcelColumn(name = "修改者ID")
    private Long updaterId;

    @ExcelColumn(name = "修改者")
    private String updaterName;

    @ExcelColumn(name = "修改时间")
    private Date updateTime;

    @ExcelColumn(name = "备注")
    private String remark;

}
