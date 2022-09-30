spos = game:GetService [[Players]].LocalPlayer.Character.HumanoidRootPart.CFrame
charar = game:GetService [[Players]].LocalPlayer.Character



pcall(
    function()
        game:GetService"RunService".RenderStepped:Connect(function()
            task.wait()
charar:WaitForChild("BoomBox"):Destroy()





charar.HumanoidRootPart.CFrame = spos + Vector3.new(0,1,0)
end)
