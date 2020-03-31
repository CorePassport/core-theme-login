<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        <div>
            <h1>${msg("registerTitle")}</h1>
            <p>${msg("noAccount")}</p>
        </div>
        <div><img class='img-responsive' src='${url.resourcesPath}/img/core-logo.png' alt='core' /></div>
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!} ${properties.kcContentWrapperClass!}" action="${url.registrationAction}" method="post">
            <div class='col-xs-12 col-md-10'>
                <div class="${properties.kcFormGroupClass!} ${properties.kcFormGroupClassRow!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                    <input
                        type="text"
                        id="firstName"
                        class="${properties.kcInputClass!}"
                        name="firstName"
                        value="${(register.formData.firstName!'')}"
                        placeholder="${msg("firstName")}"
                    />
                    <input
                        type="text"
                        id="lastName"
                        class="${properties.kcInputClass!}"
                        name="lastName"
                        value="${(register.formData.lastName!'')}"
                        placeholder="${msg("lastName")}"
                    />
                </div>

                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                    <input
                        type="text"
                        id="email"
                        class="${properties.kcInputClass!}"
                        name="email"
                        value="${(register.formData.email!'')}"
                        autocomplete="email"
                        placeholder="${msg("email")}"
                    />
                </div>
                <br/>
                <br/>
                <br/>
                <div class="${properties.kcFormGroupClass!} ${properties.kcFormGroupClassRow!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                    <#if passwordRequired>
                        <div>
                            <input
                                type="password"
                                id="password"
                                class="${properties.kcInputClass!}"
                                name="password"
                                autocomplete="new-password"
                                placeholder='${msg("password")}'/>
                             <p class='small-text'>Use 8 or more characters with a mix <br>of letters, numbers and symbols.</p>
                        </div>
                        <div>
                            <input
                                type="password"
                                id="password-confirm"
                                class="${properties.kcInputClass!}"
                                name="password-confirm"
                                placeholder='${msg("passwordConfirm")}'
                            />
                        </div>
                    </#if>
                </div>
            </div>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>

            <div class="register-footer">
                <div id="kc-form-options">
                    <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                </div>

                <div id="kc-form-buttons">
                    <input class="login-btn" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>