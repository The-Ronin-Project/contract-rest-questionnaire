group = "com.projectronin.rest.contract"

plugins {
    alias(roningradle.plugins.openapi.contract)
}

restContractSupport {
    packageName.set("com.projectronin.questionnaire.api")
    inputFile.set(project.layout.projectDirectory.file("src/main/openapi/questionnaire-service-rest-contract.yaml"))
}
