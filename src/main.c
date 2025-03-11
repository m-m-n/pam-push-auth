#include <security/pam_appl.h>
#include <security/pam_modules.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "config.h"

int pushAuth(const char *username)
{
    char command[256];
    snprintf(command, sizeof(command), "/usr/local/bin/login-push %s %s",
             username, AUTH_SERVER_BASEURL);

    FILE *pipe = popen(command, "r");
    if (pipe == NULL) {
        return -1;
    }

    char buffer[256];
    char stdoutBuffer[256];
    while (fgets(buffer, sizeof(buffer), pipe) != NULL) {
        strcat(stdoutBuffer, buffer);
    }

    int status = pclose(pipe);
    if (status != 0) {
        return status;
    }

    return 0;
}

PAM_EXTERN int pam_sm_authenticate(pam_handle_t *pamh, int flags, int argc,
                                   const char **argv)
{
    const char *username;
    int retval;

    retval = pam_get_user(pamh, &username, NULL);
    if (retval != PAM_SUCCESS) {
        return PAM_AUTH_ERR;
    }

    int status = pushAuth(username);
    if (status != 0) {
        return PAM_AUTH_ERR;
    }
    return PAM_SUCCESS;
}

PAM_EXTERN int pam_sm_setcred(pam_handle_t *pamh, int flags, int argc,
                              const char **argv)
{
    return PAM_SUCCESS;
}
