.class public Lvpos/apipackage/Session;
.super Ljava/lang/Object;
.source "Session.java"


# static fields
.field private static session:Lvpos/apipackage/Session;


# instance fields
.field private _objectContainer:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lvpos/apipackage/Session;->_objectContainer:Ljava/util/Map;

    .line 12
    return-void
.end method

.method public static getSession()Lvpos/apipackage/Session;
    .registers 1

    .line 15
    sget-object v0, Lvpos/apipackage/Session;->session:Lvpos/apipackage/Session;

    if-nez v0, :cond_e

    .line 16
    new-instance v0, Lvpos/apipackage/Session;

    invoke-direct {v0}, Lvpos/apipackage/Session;-><init>()V

    sput-object v0, Lvpos/apipackage/Session;->session:Lvpos/apipackage/Session;

    .line 17
    sget-object v0, Lvpos/apipackage/Session;->session:Lvpos/apipackage/Session;

    return-object v0

    .line 19
    :cond_e
    sget-object v0, Lvpos/apipackage/Session;->session:Lvpos/apipackage/Session;

    return-object v0
.end method


# virtual methods
.method public cleanUpSession()V
    .registers 2

    .line 32
    iget-object v0, p0, Lvpos/apipackage/Session;->_objectContainer:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 33
    return-void
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .line 28
    iget-object v0, p0, Lvpos/apipackage/Session;->_objectContainer:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .line 24
    iget-object v0, p0, Lvpos/apipackage/Session;->_objectContainer:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    return-void
.end method

.method public remove(Ljava/lang/Object;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .line 36
    iget-object v0, p0, Lvpos/apipackage/Session;->_objectContainer:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    return-void
.end method
