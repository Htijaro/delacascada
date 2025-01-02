def total_carrito(request):
    total = 0
    if request.user.is_authenticated:
        if "carrito" in request.session.keys():
            for item in request.session["carrito"].values():
                total += int(item["cantidad"])
    return {"total_carrito": total}
