from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect


from .models import Post
from .forms import PostForm

# Create your views here.

def post_create(req):
	# if req.method == "POST":
	# 	print(req.POST.get('title'))
	# 	print(req.POST.get('content'))	

	form = PostForm(req.POST or None)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.save()
		return HttpResponseRedirect(instance.get_absolute_url())
	context = {
		"form": form,
	}
	return render(req, "post_form.html", context)

def post_detail(req, id = None):
	instance = get_object_or_404(Post, id=id)
	queryset = Post.objects.all()
	context = {
		'title': 'detail',
		'instance': instance
	}
	return render(req, "detail.html", context)

def post_list(req):
	# return HttpResponse("<h1>post_list</h1>")
	# instance = Post.objects.get(id==1)
	queryset = Post.objects.all()
	context = {
		'title': 'list',
		'obj_list': queryset
	}
	return render(req, "base.html", context)

def post_update(req, id=None):
	instance = get_object_or_404(Post, id=id)
	form = PostForm(req.POST or None, instance=instance)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.save()
		return HttpResponseRedirect(instance.get_absolute_url())
	context = {
		'title': instance.title,
		'instance': instance,
		'form': form,
	}
	return render(req, "post_form.html", context)
	return HttpResponse("<h1>post_update</h1>")

def post_delete(req, id=None):
	instance = get_object_or_404(Post, id=id)
	instance.delete()
	# 页面重定向
	return redirect("list")





