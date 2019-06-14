protocol TestProtocol {
    func testFunction(str: String)
    func show()
}

extension TestProtocol {
    func testFunction(str: String) {
        print(self )
        print("extension TestProtocol \(str)")
    }
    func show() {
        print(self)
        self.testFunction(str: "测试字符串")
    }
}

class SuperClass {
}

extension SuperClass: TestProtocol {

}

class ABC: SuperClass {
    func testFunction(str: String) {
        print("ABC \(str)")
    }
}

let obj = ABC()
obj.show()
