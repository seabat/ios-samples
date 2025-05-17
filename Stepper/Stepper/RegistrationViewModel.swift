import Foundation
class RegistrationViewModel: ObservableObject {
    @Published var stages: [RegistrationStage]
    
    init() {
        self.stages = [
            RegistrationStage(name: "Form Submission", range: "", dateRange: "22 Oct - 24 Oct", isCompleted: true),
            RegistrationStage(name: "Document Review", range: "", dateRange: "07 Nov - 11 Nov", isCompleted: true),
            RegistrationStage(name: "Verification", range: "", dateRange: "11 Nov 2024", isCompleted: true),
            RegistrationStage(name: "Payment", range: "", dateRange: "12 Nov 2024", isCompleted: false),
            RegistrationStage(name: "Confirmation", range: "", dateRange: "13 Nov 2024", isCompleted: false)
        ]
    }
    
    func updateStageStatus(at index: Int) {
        guard index < stages.count else { return }
        stages[index].isCompleted.toggle()
    }
}
