package com.abc.dto;

import lombok.Data;

@Data
public class ChangePassword {
    String oldPassword;

    String newPassword;
    String reTypeNewPassword;
}
