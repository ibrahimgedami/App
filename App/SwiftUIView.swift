//
//  SwiftUIView.swift
//  App
//
//  Created by Ibrahim Mo Gedami on 10/21/23.
//

import SwiftUI

struct RegistrationStepperView: View {
    
    @State private var currentStep = 1
    @State private var isFinished = false

    var body: some View {
        VStack {
            // Enhanced Stepper Design
            HStack(spacing: 16) {
                StepCircle(step: 1, currentStep: currentStep)
                StepLine(isActive: currentStep >= 2)
                StepCircle(step: 2, currentStep: currentStep)
                StepLine(isActive: currentStep == 3 || isFinished)
                StepCircle(step: 3, currentStep: currentStep, isFinished: isFinished)
            }
            .padding(.vertical, 30)

            Spacer()

            // Content for Current Step
            VStack(spacing: 20) {
                Text("Step \(currentStep)")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                if currentStep == 1 {
                    Text("Enter your Username")
                        .font(.title3)
                        .foregroundColor(.gray)
                } else if currentStep == 2 {
                    Text("Enter your Email")
                        .font(.title3)
                        .foregroundColor(.gray)
                } else if currentStep == 3 {
                    Text("Create a Password")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
            }
            .multilineTextAlignment(.center)

            Spacer()

            // Enhanced Navigation Buttons
            HStack {
                if currentStep > 1 {
                    Button(action: {
                        withAnimation {
                            currentStep -= 1
                            isFinished = false // Reset finish state
                        }
                    }) {
                        Text("Back")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                if currentStep < 3 {
                    Button(action: {
                        withAnimation {
                            currentStep += 1
                        }
                    }) {
                        Text("Next")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                } else {
                    Button(action: {
                        withAnimation {
                            isFinished = true
                        }
                        // Simulate slight delay for animation
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            print("Registration Completed!")
                        }
                    }) {
                        Text("Finish")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

struct StepCircle: View {
    let step: Int
    let currentStep: Int
    var isFinished: Bool = false
    @State private var showCheckmark = false

    var body: some View {
        ZStack {
            if currentStep > step || (step == 3 && isFinished) {
                // Checkmark animation for completed steps
                CheckmarkView()
                    .transition(.scale) // Smooth scaling transition
            } else {
                Circle()
                    .fill(currentStep == step
                          ? LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                          : LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 50, height: 50)
                    .shadow(color: currentStep == step ? Color.blue.opacity(0.6) : Color.clear, radius: 5, x: 0, y: 3)
                    .overlay(
                        Text("\(step)")
                            .font(.headline)
                            .foregroundColor(currentStep == step ? .white : .gray)
                    )
            }
        }
        .onAppear {
            if currentStep > step || (step == 3 && isFinished) {
                withAnimation(Animation.spring().delay(0.2)) {
                    showCheckmark = true
                }
            }
        }
    }
}

struct StepLine: View {
    var isActive: Bool

    var body: some View {
        Rectangle()
            .fill(isActive
                  ? LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing)
                  : LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.2)]), startPoint: .leading, endPoint: .trailing))
            .frame(height: 3)
            .shadow(color: isActive ? Color.blue.opacity(0.6) : Color.clear, radius: 2, x: 0, y: 1)
    }
}

struct CheckmarkView: View {
    
    @State private var scale: CGFloat = 0.5

    var body: some View {
        Image(systemName: "checkmark")
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 50, height: 50)
            )
//            .scaleEffect(scale)
            .onAppear {
                withAnimation(.spring()) {
                    scale = 1.0
                }
            }
    }
}

//struct RegistrationStepperView: View {
//    
//    @State private var currentStep = 1
//
//    var body: some View {
//        VStack {
//            // Enhanced Stepper Design
//            HStack(spacing: 16) {
//                StepCircle(step: 1, currentStep: currentStep)
//                StepLine(isActive: currentStep >= 2)
//                StepCircle(step: 2, currentStep: currentStep)
//                StepLine(isActive: currentStep == 3)
//                StepCircle(step: 3, currentStep: currentStep)
//            }
//            .padding(.vertical, 30)
//
//            Spacer()
//
//            // Content for Current Step
//            VStack(spacing: 20) {
//                Text("Step \(currentStep)")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//
//                if currentStep == 1 {
//                    Text("Enter your Username")
//                        .font(.title3)
//                        .foregroundColor(.gray)
//                } else if currentStep == 2 {
//                    Text("Enter your Email")
//                        .font(.title3)
//                        .foregroundColor(.gray)
//                } else if currentStep == 3 {
//                    Text("Create a Password")
//                        .font(.title3)
//                        .foregroundColor(.gray)
//                }
//            }
//            .multilineTextAlignment(.center)
//
//            Spacer()
//
//            // Enhanced Navigation Buttons
//            HStack {
//                if currentStep > 1 {
//                    Button(action: {
//                        withAnimation {
//                            currentStep -= 1
//                        }
//                    }) {
//                        Text("Back")
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                    }
//                }
//                if currentStep < 3 {
//                    Button(action: {
//                        withAnimation {
//                            currentStep += 1
//                        }
//                    }) {
//                        Text("Next")
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                            .shadow(radius: 5)
//                    }
//                } else {
//                    Button(action: {
//                        // Finish action
//                        print("Registration Completed!")
//                    }) {
//                        Text("Finish")
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.green)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                            .shadow(radius: 5)
//                    }
//                }
//            }
//            .padding(.horizontal)
//        }
//        .padding()
//    }
//}
//
//struct StepCircle: View {
//    
//    let step: Int
//    let currentStep: Int
//
//    var body: some View {
//        ZStack {
//            Circle()
//                .fill(currentStep >= step
//                      ? LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
//                      : LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
//                .frame(width: 50, height: 50)
//                .shadow(color: currentStep >= step ? Color.blue.opacity(0.6) : Color.clear, radius: 5, x: 0, y: 3)
//            Text("\(step)")
//                .font(.headline)
//                .foregroundColor(currentStep >= step ? .white : .gray)
//        }
//    }
//
//}
//
//struct StepLine: View {
//    
//    var isActive: Bool
//
//    var body: some View {
//        Rectangle()
//            .fill(isActive
//                  ? LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing)
//                  : LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.2)]), startPoint: .leading, endPoint: .trailing))
//            .frame(height: 3)
//            .shadow(color: isActive ? Color.blue.opacity(0.6) : Color.clear, radius: 2, x: 0, y: 1)
//    }
//
//}
