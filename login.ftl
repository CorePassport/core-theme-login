<#import "templateRegister.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        <div><img class='img-responsive' src='${url.resourcesPath}/img/core-logo.png' alt='core' /></div>
        <h1>${msg("doLogIn")}</h1>
        <p>${msg("doLogInSubtitle")}</p>
    <#elseif section = "form">
    <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
      <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                    <#if usernameEditDisabled??>
                        <input
                            tabindex="1"
                            id="username"
                            class="${properties.kcInputClass!}"
                            name="username"
                            value="${(login.username!'')}"
                            type="text"
                            placeholder='${msg("usernameOrEmail")}'
                            disabled />
                            <span><a tabindex="5" href="" class='greenLink'>${msg("doForgotCoreId")}</a></span>
                    <#else>
                        <input
                            tabindex="1"
                            id="username"
                            class="${properties.kcInputClass!}"
                            name="username"
                            value="${(login.username!'')}"
                            type="text"
                            placeholder='${msg("usernameOrEmail")}'
                            autocomplete="off" />
                            <span><a tabindex="5" href="${url.loginResetCredentialsUrl}" class='greenLink'>${msg("doForgotPassword")}</a></span>
                    </#if>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <input
                        tabindex="2"
                        id="password"
                        class="${properties.kcInputClass!}"
                        name="password"
                        type="password"
                        placeholder='${msg("password")}'
                        autocomplete="off" />
                        <#if realm.resetPasswordAllowed>
                            <span><a tabindex="5" href="${url.loginResetCredentialsUrl}" class='greenLink'>${msg("doForgotPassword")}</a></span>
                        </#if>

                </div>

                  <div id="kc-form-buttons">
                    <input tabindex="4" class="login-btn" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                  </div>
            </form>
            <div class='divider'><span>or</span></div>
            <div id="kc-registration">
                <h2>${msg("doRegister")}</h2>
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegisterLink")}</a></span>
            </div>
        </#if>
        </div>
      </div>
    <#elseif section = "info" >
    </#if>

</@layout.registrationLayout>