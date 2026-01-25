import SwiftUI

struct RegistrationStatusView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            headerView
            stageListView
            Spacer()
        }
        .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var headerView: some View {
        Text("Registration Status")
            .font(.system(size: 16, weight: .bold))
            .padding(.bottom, 30)
            .padding(.top, 20)
    }
    
    private var stageListView: some View {
        VStack(spacing: 0) {
            ForEach(viewModel.stages.indices, id: \.self) { index in
                let stage = viewModel.stages[index]
                let isLast = index == viewModel.stages.count - 1
                let nextStageCompleted = index + 1 < viewModel.stages.count ? viewModel.stages[index + 1].isCompleted : false
                
                HStack {
                    StageRowView(stage: stage,
                               isLast: isLast,
                               nextStageCompleted: nextStageCompleted)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .onTapGesture {
                    withAnimation {
                        viewModel.updateStageStatus(at: index)
                    }
                }
            }
        }
    }
}

#Preview {
    RegistrationStatusView()
}

